//
//  HomeViewModelContract.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 30/03/2022.
//

import Foundation

typealias HomeViewModelContract = BaseViewModel & ObservableObject & HomeViewModelInput & HomeViewModelOutput

protocol HomeViewModelInput {
    func loadPhotos()
    func loadMorePhotos()
}

protocol HomeViewModelOutput {
    func getPhotoData(for indexPath: IndexPath) -> PhotoData?
    func getPhotoSize(for indexPath: IndexPath) -> (Float, Float)
}
