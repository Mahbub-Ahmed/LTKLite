//
//  DetailsViewModel.swift
//  LTKLite
//
//  Created by Mahbub Ahmed on 1/28/24.
//

import UIKit
import Foundation
import Observation

@Observable
class DetailsViewModel: ViewModel {
    let heroImageURL: String
    let displayName: String
    let profileImageUrl: String
    var images = [String: UIImage]()
    var products = [ProductViewData]()
    
    var network: NetworkService { Network() }
    
    init(ltk: LTKViewData, profile: Profile, products: [String: Product]) {
        heroImageURL = ltk.imageUrl
        displayName = profile.displayName
        profileImageUrl = profile.avatarUrl
        
        self.products = ltk.prodcutIds.compactMap{ id in
            guard let product = products[id] else { return nil }
            return ProductViewData(id: product.id, imageUrl: product.imageUrl, hyperlink: product.hyperlink)
        }
    }
 
    func loadImages() {
        Task {
            images[heroImageURL] = try await UIImage(data: network.fetchImage(for: heroImageURL))
            images[profileImageUrl] = try await UIImage(data: network.fetchImage(for: profileImageUrl))
            for product in products {
                images[product.imageUrl] = try await UIImage(data: network.fetchImage(for: product.imageUrl))
            }
        }
    }
}
