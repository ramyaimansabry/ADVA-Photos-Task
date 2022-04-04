//
//  HomeViewModel.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 30/03/2022.
//

import Combine
import Foundation

final class HomeViewModel: HomeViewModelContract {
    private let fetchPhotosUseCase: FetchPhotosListUseCaseContract
    
    @Published var photosList: [PhotoData] = []
    
    init(fetchPhotosUseCase: FetchPhotosListUseCaseContract = FetchPhotosListUseCase()) {
        self.fetchPhotosUseCase = fetchPhotosUseCase
        super.init()
        
        self.loadPhotos()
    }
    
    // MARK: - Input Methods
    func loadPhotos() {
        fetchPhotosUseCase
            .execute()
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                guard let self = self else { return }
                guard case .failure(let error) = completion else { return }
                self.state = .failed(error)
            } receiveValue: { [weak self] photosListResponse in
                guard let self = self else { return }
                self.photosList.append(contentsOf: photosListResponse)
                self.state = .successful
            }
            .store(in: &cancellables)

    }
    
    // MARK: - Output Methods
    func getPhotoData(for indexPath: IndexPath) -> PhotoData? {
        return photosList[safe: indexPath.row]
    }
    
    func getPhotoSize(for indexPath: IndexPath) -> (Float, Float) {
        guard
            let item: PhotoData = photosList[safe: indexPath.row],
            let width: Float = item.width,
            let height: Float = item.height
        else {
            return (100, 50)
        }
        
        return (width, height)
    }
}
