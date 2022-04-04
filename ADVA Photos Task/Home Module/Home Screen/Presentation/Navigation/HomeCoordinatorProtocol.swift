//
//  HomeCoordinatorProtocol.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 04/04/2022.
//

import Foundation

protocol HomeCoordinatorProtocol: AnyObject {
    func presentDetailsScreen(using photoData: PhotoData)
}
