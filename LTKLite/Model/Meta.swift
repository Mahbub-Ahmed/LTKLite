//
//  Meta.swift
//  LTKLite
//
//  Created by Mahbub Ahmed on 1/28/24.
//

import Foundation

struct Meta: Decodable {
    let lastId: String
    let numResults: Int
    let totalResults: Int
    let limit: Int
    let seed: String
    let nextUrl: String?
}
