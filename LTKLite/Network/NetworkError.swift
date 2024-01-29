//
//  NetworkError.swift
//  LTKLite
//
//  Created by Mahbub Ahmed on 1/28/24.
//

import Foundation

public enum NetworkError: Error {
    case invalidURL
    case invalidRequest
    case invalidResponse
    case decodingError
    case unknow
}
