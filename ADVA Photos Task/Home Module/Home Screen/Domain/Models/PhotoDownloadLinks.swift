//
//  PhotoDownloadLinks.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 03/04/2022.
//

import Foundation

struct PhotoDownloadLinks: Decodable {
    let linksSelf: String?
    let html: String?
    let download: String?
    let downloadLocation: String?
}
