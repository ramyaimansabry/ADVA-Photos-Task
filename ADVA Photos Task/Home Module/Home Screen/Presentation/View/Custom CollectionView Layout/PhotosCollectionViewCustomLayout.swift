//
//  PhotosCollectionViewCustomLayout.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 04/04/2022.
//

import UIKit

class PhotosCollectionViewCustomLayout: UICollectionViewLayout {
    private weak var delegate: CollectionViewCustomLayoutDelegate?
    private var cache = [UICollectionViewLayoutAttributes]()
    private var contentHeight: CGFloat = 0
    
    var numberOfColums: Int
    var cellPadding: CGFloat
    
    private var contentWidth: CGFloat {
        guard let collectionView = collectionView else { return .zero }
        return collectionView.bounds.width
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    init(
        delegate: CollectionViewCustomLayoutDelegate?,
        numberOfColums: Int = 2,
        cellPadding: CGFloat = 5
    ) {
        self.delegate = delegate
        self.numberOfColums = numberOfColums
        self.cellPadding = cellPadding
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        guard let collectionView = collectionView, let delegate = delegate else { return }
                
        let columWidth = contentWidth / CGFloat(numberOfColums)
        var xOffset = [CGFloat]()
        for colum in 0..<numberOfColums {
            xOffset.append(CGFloat(colum) * columWidth)
        }
        
        var colum = 0
        var yOffset = [CGFloat](repeating: 0, count: numberOfColums)
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            let photoSize: CGSize = delegate.collectionView(collectionView, sizeOfItemAtIndexPath: indexPath)
            
            let cellWidth = columWidth
            
            var cellHeight = photoSize.height * cellWidth / photoSize.width
            cellHeight = cellPadding * 2 + cellHeight
            
            let frame = CGRect(x: xOffset[colum], y: yOffset[colum], width: cellWidth, height: cellHeight)
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            cache.append(attributes)
            
            contentHeight = max(contentHeight, frame.maxY)
            yOffset[colum] = yOffset[colum] + cellHeight
            
            if numberOfColums > 1 {
                var isColumChanged: Bool = false
                for index in (1..<numberOfColums).reversed() {
                    if yOffset[index] >= yOffset[index - 1] {
                        colum = index - 1
                        isColumChanged = true
                    } else {
                        break
                    }
                }
                
                if isColumChanged {
                    continue
                }
            }
            
            colum = colum < (numberOfColums - 1) ? (colum + 1) : 0
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attribute in cache {
            if attribute.frame.intersects(rect) {
                visibleLayoutAttributes.append(attribute)
            }
        }
        
        return visibleLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
}
