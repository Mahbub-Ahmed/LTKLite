//
//  Profile.swift
//  LTKLite
//
//  Created by Mahbub Ahmed on 1/28/24.
//

import Foundation

struct Profile: Decodable {
    let id: String
    let avatarUrl: String
    let avatarUploadUrl: String?
    let displayName: String
    let fullName: String
    let instagramName: String
    let blogName: String
    let blogUrl: String
    let bgImageUrl: String?
    let bgUploadUrl: String?
    let bio: String
    let rsAccountId: Int
    let searchable: Bool
    let classification: Classification?
}

struct Classification: Decodable {
    let height: Double?
    let bodyShapes: [BodyShape]?
}

struct BodyShape: Decodable {
    let type: String
    let value: String
}
