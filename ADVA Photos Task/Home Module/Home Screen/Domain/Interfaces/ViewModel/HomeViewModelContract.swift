//
//  HomeViewModelContract.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 30/03/2022.
//

import Foundation

typealias HomeViewModelContract = BaseViewModel & ObservableObject & HomeViewModelInput & HomeViewModelOutput

/// This protocol is used if your ViewModel contains Inputs
/// Otherwise you could remove it
protocol HomeViewModelInput {
    // TODO: Add Related ViewModel Inputs
}

/// This protocol is used if your ViewModel contains Outputs
/// Otherwise you could remove it
protocol HomeViewModelOutput {
    // TODO: Add Related ViewModel Outputs
}
