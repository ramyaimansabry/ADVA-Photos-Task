//
//  PhotoDetailsViewModelContract.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 30/03/2022.
//

import Foundation

typealias PhotoDetailsViewModelContract = BaseViewModel & ObservableObject & PhotoDetailsViewModelInput & PhotoDetailsViewModelOutput

/// This protocol is used if your ViewModel contains Inputs
/// Otherwise you could remove it
protocol PhotoDetailsViewModelInput {
    // TODO: Add Related ViewModel Inputs
}

/// This protocol is used if your ViewModel contains Outputs
/// Otherwise you could remove it
protocol PhotoDetailsViewModelOutput {
    // TODO: Add Related ViewModel Outputs
}
