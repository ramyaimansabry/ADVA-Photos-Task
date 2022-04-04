//
//  PhotoSponsorship.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 04/04/2022.
//

import Foundation

struct PhotoSponsorship: Decodable {
    let impressionUrls: [String]?
    let tagline: String?
    let sponsor: PhotoOwner?
}
