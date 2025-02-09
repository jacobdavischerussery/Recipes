//
//  RecipesAPI.swift
//  Networking
//
//  Created by Jacob Davis on 2/7/25.
//

// Add all different types of apis related to recipe service
public enum RecipesAPI {
    case getRecipes
}

// MARK: TargetType Extensions
extension RecipesAPI: TargetType {
    public var path: String? {
        switch self {
        case .getRecipes:
            return "recipes.json"
        }
    }

    public var method: Method {
        switch self {
        case .getRecipes:
            return .get
        }
    }
    
    public var headers: [String: String]? {
        return nil
    }
}
