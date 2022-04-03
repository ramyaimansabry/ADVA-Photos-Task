//
//  FetchPhotosListUseCaseUseCaseContract.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 30/03/2022.
//

import Combine

protocol FetchPhotosListUseCaseContract {
    func execute() -> AnyPublisher<[PhotoData], BaseError>
}
