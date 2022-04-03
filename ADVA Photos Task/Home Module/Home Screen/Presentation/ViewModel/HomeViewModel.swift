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
}

private extension HomeViewModel {
    func loadPhotos() {
        fetchPhotosUseCase
            .execute()
            .receive(on: RunLoop.main)
            .sink { completion in
                print(completion)
            } receiveValue: { photosListResponse in
                print(photosListResponse)
            }
            .store(in: &cancellables)

    }
}
