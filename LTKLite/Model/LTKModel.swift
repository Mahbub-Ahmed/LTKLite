//
//  LTKModel.swift
//  LTKLite
//
//  Created by Mahbub Ahmed on 1/28/24.
//

import Foundation

struct LTKModel: Decodable {
    let id: String
    let heroImage: String
    let heroImageWidth: Double
    let heroImageHeight: Double
    let profileId: String
    let profileUserId: String
    let videoMediaId: String?
    let status: String
    let caption: String
    let shareUrl: String
    let dateCreated: String
    let dateUpdated: String
    let dateScheduled: String?
    let datePublished: String
    let productIds: [String]
    let hash: String
}
