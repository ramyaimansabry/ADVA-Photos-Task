//
//  FetchPhotosListUseCaseUseCase.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 30/03/2022.
//

import Combine

final class FetchPhotosListUseCase: DisposeObject, FetchPhotosListUseCaseContract {
    private let repository: HomeRepositoryContract
    
    init(repository: HomeRepositoryContract = HomeRepository()) {
        self.repository = repository
        super.init()
    }
    
    func execute(
        with pageIndex: Int,
        and pageSize: Int
    ) -> AnyPublisher<[PhotoData], BaseError> {
        repository.fetchPhotosList(with: pageIndex, and: pageSize)
    }
}
