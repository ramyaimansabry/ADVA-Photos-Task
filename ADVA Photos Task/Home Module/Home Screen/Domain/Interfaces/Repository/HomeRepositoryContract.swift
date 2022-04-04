//
//  HomeRepositoryContract.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 30/03/2022.
//

import Combine

protocol HomeRepositoryContract {
    func fetchPhotosList(
        with pageIndex: Int,
        and pageSize: Int
    ) -> AnyPublisher<[PhotoData], BaseError>
}
