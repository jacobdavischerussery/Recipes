//
//  ImageAPI.swift
//  Networking
//
//  Created by Jacob Davis on 2/7/25.
//

public enum ImageAPI {
    case getImage(url: String)
}

// MARK: TargetType Extensions
extension ImageAPI: TargetType {
    public var baseURLString: String {
        switch self {
        case let .getImage(url):
            return url
        }
    }
    
    public var path: String? {
        return nil
    }

    public var method: Method {
        switch self {
        case .getImage:
            return .get
        }
    }
    
    public var headers: [String: String]? {
        return nil
    }
}
