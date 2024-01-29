//
//  NetworkService.swift
//  LTKLite
//
//  Created by Mahbub Ahmed on 1/28/24.
//

import Foundation

public protocol NetworkService: AnyObject {
    func request<Target: NetworkTarget>(target: Target) async throws -> Target.Model where Target.Model: Decodable
    
    func fetchImage(for urlString: String) async throws -> Data
}
