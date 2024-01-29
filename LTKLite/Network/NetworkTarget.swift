//
//  NetworkTarget.swift
//  LTKLite
//
//  Created by Mahbub Ahmed on 1/28/24.
//

import Foundation

public protocol NetworkTarget {
    /// The model structure that the API endpoint will translate data into on a successful response
    associatedtype Model
    
    /// The URL scheme (e.g "https")
    var scheme: String { get }
    
    /// The host name (e.g "rewardstyle.com")
    var host: String { get }
    
    /// The URL path (e.g "/api/ltk/v2/ltks")
    var path: String { get }
    
    /// Headers for the request
    var headers: [String: String] { get }
    
    /// Data for request body
    var body: Data? { get }
    
    /// Query parameters to add to the URL
    var parameters: [String: String] { get }
    
    /// Request HTTP method (e.g "GET")
    var httpMethod: HTTPMethod { get }
    
    /// Creates an URL request utilizing the properties
    var urlRequest: URLRequest { get }
}


///Default implementation
extension NetworkTarget {
    var scheme: String { "https" }
    var body: Data? { nil }
    var headers: [String: String] { [:] }
    var parameters: [String: String] { [:] }
    var httpMethod: HTTPMethod { .get }
    
    var urlRequest: URLRequest {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        
        if !parameters.isEmpty {
            components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        
        var request = URLRequest(url: components.url!)
        request.httpBody = body
        request.httpMethod = httpMethod.rawValue
        
        headers.forEach{ request.addValue($0.value, forHTTPHeaderField: $0.key) }
        
        return request
    }
}
