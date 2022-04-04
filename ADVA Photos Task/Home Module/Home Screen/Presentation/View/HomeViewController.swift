//
//  HomeViewController.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 30/03/2022.
//

import UIKit
import Combine

class HomeViewController: UIViewController {
    
    @IBOutlet weak var photosListCollectionView: UICollectionView!
    
    private lazy var photosListCustomCollectionViewLayout: PhotosCollectionViewCustomLayout = {
        let layout = PhotosCollectionViewCustomLayout(
            delegate: self,
            numberOfColums: 2,
            cellPadding: 5
        )
        return layout
    }()
    
    private var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViewList()
        subscribeForPhotosListChanges()
        viewModel.loadPhotos()
    }
    

}

private extension HomeViewController {
    func setupCollectionViewList() {
        photosListCollectionView.delegate = self
        photosListCollectionView.dataSource = self
        photosListCollectionView.collectionViewLayout = photosListCustomCollectionViewLayout
        photosListCollectionView.register(
            UINib(nibName: "PhotoCell", bundle: nil),
            forCellWithReuseIdentifier: "PhotoCell"
        )
        photosListCollectionView.showsVerticalScrollIndicator = false
        photosListCollectionView.showsHorizontalScrollIndicator = false
    }
    
    func subscribeForPhotosListChanges() {
        _ = viewModel.photosList.publisher.sink { [weak self] _ in
            self?.photosListCollectionView.reloadData()
        }
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.photosList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        cell.data = viewModel.getPhotoData(for: indexPath)
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {}

extension HomeViewController: CollectionViewCustomLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, sizeOfItemAtIndexPath indexPath: IndexPath) -> CGSize {
        let size = viewModel.getPhotoSize(for: indexPath)
        return CGSize(width: CGFloat(size.0), height: CGFloat(size.1))
    }
}
