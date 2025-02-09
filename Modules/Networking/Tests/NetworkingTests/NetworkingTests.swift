import XCTest
import Foundation
@testable import Networking

final class EngineTests: XCTestCase {
    var engine: Engine!
    var mockSession: MockNetworkSession!
    
    override func setUp() {
        super.setUp()
        mockSession = MockNetworkSession()
        engine = Engine(session: mockSession) // Inject mock session
    }
    
    override func tearDown() {
        engine = nil
        mockSession = nil
        super.tearDown()
    }
    
    func testRequest_SuccessfulResponse() async throws {
        // Arrange: Set up mock data
        guard let url = Bundle.module.url(forResource: "SampleResponse", withExtension: "json") else {
            XCTFail("File not found")
            return
        }
        let jsonData = try Data(contentsOf: url)
        mockSession.mockData = jsonData
        mockSession.mockResponse = HTTPURLResponse(url: URL(string: "https://example.com")!,
                                                   statusCode: 200,
                                                   httpVersion: nil,
                                                   headerFields: nil)
        
        // Act
        let result: RecipesResponse = try await engine.request(RecipesAPI.getRecipes, type: RecipesResponse.self)
        
        // Assert
        XCTAssertEqual(result.recipes[0].id, "0c6ca6e7-e32a-4053-b824-1dbf749910d8")
        XCTAssertEqual(result.recipes[0].name, "Apam Balik")
    }

    func testRequest_DecodingError() async {
        // Arrange: Mock incorrect JSON response
        mockSession.mockData = "Invalid JSON".data(using: .utf8)
        mockSession.mockResponse = HTTPURLResponse(url: URL(string: "https://example.com")!,
                                                   statusCode: 200,
                                                   httpVersion: nil,
                                                   headerFields: nil)
        do {
            _ = try await engine.request(RecipesAPI.getRecipes, type: Recipe.self)
            XCTFail("Expected to throw, but did not")
        } catch {
            XCTAssertEqual(error as? NetworkError, .decodingError)
        }
    }
}
