//
//  CollectionViewCustomLayoutDelegate.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 04/04/2022.
//

import UIKit

protocol CollectionViewCustomLayoutDelegate: AnyObject {
    func collectionView(_ collectionView: UICollectionView, sizeOfItemAtIndexPath indexPath: IndexPath) -> CGSize
}
