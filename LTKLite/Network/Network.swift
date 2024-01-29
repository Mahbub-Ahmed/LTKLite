//
//  Network.swift
//  LTKLite
//
//  Created by Mahbub Ahmed on 1/28/24.
//

import Foundation

final class Network: NetworkService {
    
    func request<Target: NetworkTarget>(target: Target) async throws -> Target.Model where Target.Model : Decodable {
        let (data, response) = try await URLSession.shared.data(for: target.urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw NetworkError.invalidResponse }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(Target.Model.self, from: data)
    }
    
    
    func fetchImage(for urlString: String) async throws -> Data {
        guard let url = URL(string: urlString) else { throw NetworkError.invalidURL }
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
}
