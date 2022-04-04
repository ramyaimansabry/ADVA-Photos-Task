//
//  PhotoDetailsViewModelContract.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 30/03/2022.
//

import Foundation

typealias PhotoDetailsViewModelContract = BaseViewModel & ObservableObject & PhotoDetailsViewModelInput & PhotoDetailsViewModelOutput

protocol PhotoDetailsViewModelInput {}

protocol PhotoDetailsViewModelOutput {}
