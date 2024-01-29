//
//  ImageCache.swift
//  LTKLite
//
//  Created by Mahbub Ahmed on 1/28/24.
//

import Foundation

class ImageCache {
    typealias Cache = NSCache<NSString, NSData>
    
    static let shared = ImageCache()
    private var cache = Cache()
    
    func image(for key: String) -> Data? {
        let key = NSString(string: key)
        return cache.object(forKey: key) as? Data
    }
    
    func cahce(image data: Data, for key: String) {
        let key = NSString(string: key)
        let data = data as NSData
        cache.setObject(data, forKey: key)
    }
}
