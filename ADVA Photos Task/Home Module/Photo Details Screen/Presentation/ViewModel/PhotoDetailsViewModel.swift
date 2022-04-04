//
//  PhotoDetailsViewModel.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 30/03/2022.
//

import Combine

final class PhotoDetailsViewModel: PhotoDetailsViewModelContract {
    private let photoData: PhotoData
    
    var photoURL: String? {
        return photoData.urls?.full
    }
    
    init(photoData: PhotoData) {
        self.photoData = photoData
        super.init()
    }
}
