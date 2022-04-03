//
//  PhotosListResponse.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 30/03/2022.
//

import Foundation

struct PhotoData: Decodable {
    let id: String
    let createdAt: String?
    let updatedAt: String?
    let promotedAt: String?
    let width: Int?
    let height: Int?
    let color: String?
    let blurHash: String?
    let welcomeDescription: String?
    let altDescription: String?
    let urls: PhotoURLs?
    let links: PhotoDownloadLinks?
    let likes: Int?
    let likedByUser: Bool?
    let user: PhotoOwner?
}
