//
//  HomeServiceContract.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 30/03/2022.
//

import Combine

protocol HomeServiceContract {
    func fetchphotosList() -> AnyPublisher<[PhotoData], BaseError>
}
