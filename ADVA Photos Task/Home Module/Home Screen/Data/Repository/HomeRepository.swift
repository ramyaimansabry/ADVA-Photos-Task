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
    
    func fetchPhotosList() -> AnyPublisher<[PhotoData], BaseError> {
        return service.fetchphotosList()
            .eraseToBaseError()
            .eraseToAnyPublisher()
    }
}
