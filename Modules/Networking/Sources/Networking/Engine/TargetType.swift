//
//  TargetType.swift
//  Networking
//
//  Created by Jacob Davis on 2/6/25.
//

import Foundation

public protocol TargetType {
    /// The target's base `URL`.
    var baseURLString: String { get }

    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String? { get }

    /// The HTTP method used in the request.
    var method: Method { get }

    /// Provides stub data for use in testing. Default is `Data()`.
    var sampleData: Data { get }

    /// The headers to be used in the request.
    var headers: [String: String]? { get }
}

extension TargetType {
    public var sampleData: Data {
        Data()
    }
    
    public var baseURLString: String {
        return "https://d3jbb8n5wk0qxi.cloudfront.net/"
    }
}

public enum Method: String {
    case get = "GET"
}
