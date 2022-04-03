//
//  PhotoOwner.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 03/04/2022.
//

import Foundation

struct PhotoOwner: Decodable {
    let id: String?
    let updatedAt: String?
    let username: String?
    let name: String?
    let firstName: String?
    let lastName: String?
    let twitterUsername: String?
    let portfolioURL: String?
    let bio: String?
    let profileImage: PhotoOwnerProfileImage?
    let instagramUsername: String?
    let totalCollections: Int?
    let totalLikes: Int?
    let totalPhotos: Int?
    let acceptedTos: Bool?
    let forHire: Bool?
}

struct PhotoOwnerProfileImage: Decodable {
    let small: String?
    let medium: String?
    let large: String?
}
