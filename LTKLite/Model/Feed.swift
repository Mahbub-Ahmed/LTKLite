//
//  Feed.swift
//  LTKLite
//
//  Created by Mahbub Ahmed on 1/28/24.
//

import Foundation

struct Feed: Decodable {
    let ltks: [LTKModel]
    let profiles: [Profile]
    let products: [Product]
    let meta: Meta
}
