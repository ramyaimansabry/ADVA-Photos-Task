//
//  HomeService.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 30/03/2022.
//

import Combine

final class HomeService: DisposeObject, HomeServiceContract {
    private var apiService: APIServiceContract
    
    init(apiService: APIServiceContract = APIService.shared) {
        self.apiService = apiService
        super.init()
    }
    
    func fetchphotosList(
        with pageIndex: Int,
        and pageSize: Int
    ) -> AnyPublisher<[PhotoData], BaseError> {
        let request = APIBuilder()
            .setPath(using: .fetchPhotosList, argument: ["\(pageIndex)", "\(pageSize)"])
            .setMethod(using: .get)
            .build()
        
        return apiService
            .request(
                using: request,
                responseType: [PhotoData].self
            )
    }
}
