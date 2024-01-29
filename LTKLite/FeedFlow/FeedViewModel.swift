//
//  FeedViewModel.swift
//  LTKLite
//
//  Created by Mahbub Ahmed on 1/28/24.
//

import UIKit
import Foundation

@Observable
class FeedViewModel: ViewModel {
    var lastFeedId: String?
    var totalUsers = Int.max
    var viewState: ViewState = .loading
    
    var ltks = [LTKViewData]()
    var images = [String: UIImage]()
    var products = [String: Product]()
    var profiles = [String: Profile]()
    
    var network: NetworkService { Network() }
}

extension FeedViewModel {
    func loadFeed() {
        Task {
            do {
                guard ltks.count < totalUsers else { return }
                let feed = try await network.request(target: FeedTarget(limit:20, lastId: lastFeedId))
                
                updatedData(feed: feed)
                viewState = .loaded
                fetchImages()
            } catch {
                viewState = .failure
            }
        }
    }
    
    func fetchImages() {
        Task {
            for ltk in ltks {
                let data = try await network.fetchImage(for: ltk.imageUrl)
                if let image = UIImage(data: data) { images[ltk.imageUrl] = image }
            }
        }
    }
    
    func updatedData(feed: Feed) {
        ///Set last feed id for pagination
        lastFeedId = feed.meta.lastId
        
        /// Update Profile data
        for profile in feed.profiles { profiles[profile.id] = profile }

        /// Update Product Data
        for product in feed.products { products[product.id] = product }
        
        /// Update LTK data
        ltks.append(contentsOf: feed.ltks.map{ LTKViewData(id: $0.id,
                                                            profileId: $0.profileId,
                                                            imageUrl: $0.heroImage,
                                                            prodcutIds: $0.productIds) })
    }
}

