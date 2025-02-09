// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

enum NetworkError: Error {
    case invalidURL
    case serverError
    case decodingError
    case unknownError
}

public protocol URLSessionProtocol {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

public final class Engine {
    let session: URLSessionProtocol
    
    public init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func request<T: Decodable>(_ target: TargetType, type: T.Type) async throws -> T {
        guard let baseURL = URL(string: target.baseURLString) else {
            throw NetworkError.invalidURL
        }
        let url: URL
        if let path = target.path {
            url = baseURL.appendingPathComponent(path)
        } else {
            url = baseURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = target.method.rawValue
        request.allHTTPHeaderFields = target.headers
        
        do {
            let (data, response) = try await session.data(for: request)
            // Check for server errors
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 400 {
                throw NetworkError.serverError
            }
            
            do {
                let json = try JSONDecoder().decode(type.self, from: data)
                return json
            } catch {
                print(error)
                throw NetworkError.decodingError
            }
        } catch let error as URLError {
            print(error)
            throw NetworkError.serverError
        }
    }
}

// For Testability
extension URLSession: URLSessionProtocol {}
