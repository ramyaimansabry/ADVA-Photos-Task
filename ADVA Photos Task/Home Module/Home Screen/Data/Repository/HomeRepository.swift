//
//  HomeRepository.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 30/03/2022.
//

import Combine

final class HomeRepository: DisposeObject, HomeRepositoryContract {
    private let service: HomeServiceContract
    
    init(service: HomeServiceContract = HomeService()) {
        self.service = service
        super.init()
    }
    
    func fetchPhotosList(
        with pageIndex: Int,
        and pageSize: Int
    ) -> AnyPublisher<[PhotoData], BaseError> {
        return service.fetchphotosList(with: pageIndex, and: pageSize)
            .eraseToBaseError()
            .eraseToAnyPublisher()
    }
}
