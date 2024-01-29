//
//  FeedTarget.swift
//  LTKLite
//
//  Created by Mahbub Ahmed on 1/29/24.
//

import Foundation

struct FeedTarget: NetworkTarget {
    typealias Model = Feed
    
    let limit: Int
    let lastId: String?
    
    var host: String { "api-gateway.rewardstyle.com" }
    var path: String { "/api/ltk/v2/ltks/"}
    
    var parameters: [String : String] {
        var parameters = ["featured": "true", "limit": "\(limit)"]

        if let lastId = lastId { parameters["last_id"] = lastId }
        return parameters
    }
    
}
