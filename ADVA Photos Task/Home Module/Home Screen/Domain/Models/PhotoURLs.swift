//
//  PhotoURLs.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 03/04/2022.
//

import Foundation

struct PhotoURLs: Decodable {
    let raw: String?
    let full: String?
    let regular: String?
    let small: String?
    let thumb: String?
    let smallS3: String?
}
