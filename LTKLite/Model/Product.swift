//
//  Product.swift
//  LTKLite
//
//  Created by Mahbub Ahmed on 1/28/24.
//

import Foundation

struct Product: Decodable {
    let id: String
    let ltkId: String
    let hyperlink: String
    let imageUrl: String
    let links: Link
    let matching: String
    let productDetailsId: String
    let retailerId: String
    let retailerDisplayName: String
}
