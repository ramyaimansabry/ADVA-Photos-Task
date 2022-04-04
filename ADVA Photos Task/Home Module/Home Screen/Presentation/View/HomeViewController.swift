//
//  HomeViewController.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 30/03/2022.
//

import UIKit
import Combine

class HomeViewController: BaseViewController {
    @IBOutlet weak var photosListCollectionView: UICollectionView!
    
    private lazy var photosListCustomCollectionViewLayout: PhotosCollectionViewCustomLayout = {
        let layout = PhotosCollectionViewCustomLayout(
            delegate: self,
            numberOfColums: 2,
            cellPadding: 5
        )
        return layout
    }()
    
    private let viewModel = HomeViewModel()
    
    var coordinator: HomeCoordinatorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupCollectionViewList()
        subscribeForPhotosListChanges()
        viewModel.loadPhotos()
    }
}

// MARK: - Private Methods

private extension HomeViewController {
    func setupCollectionViewList() {
        photosListCollectionView.delegate = self
        photosListCollectionView.dataSource = self
//        photosListCollectionView.collectionViewLayout = photosListCustomCollectionViewLayout
        photosListCollectionView.register(
            UINib(nibName: "PhotoCell", bundle: nil),
            forCellWithReuseIdentifier: "PhotoCell"
        )
        photosListCollectionView.showsVerticalScrollIndicator = false
        photosListCollectionView.showsHorizontalScrollIndicator = false
    }
    
    func subscribeForPhotosListChanges() {
        viewModel.$photosList.sink { [weak self] _ in
            DispatchQueue.main.async {
                self?.photosListCollectionView.reloadData()
                
            }
        }.store(in: &cancellables)
    }
    
    func setupNavigationBar() {
        navigationItem.title = "Featured"
    }
}

// MARK: - UICollectionViewDataSource

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

// MARK: - UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == viewModel.photosList.count - 5 {
            viewModel.loadMorePhotos()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let photoData: PhotoData = viewModel.getPhotoData(for: indexPath) else { return }
        coordinator?.presentDetailsScreen(using: photoData)
    }
}

// MARK: - CollectionViewCustomLayoutDelegate

extension HomeViewController: CollectionViewCustomLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, sizeOfItemAtIndexPath indexPath: IndexPath) -> CGSize {
        let size = viewModel.getPhotoSize(for: indexPath)
        return CGSize(width: CGFloat(size.0), height: CGFloat(size.1))
    }
}
