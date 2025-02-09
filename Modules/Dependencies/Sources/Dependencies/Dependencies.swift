import Foundation

public actor DependencyRegistry {
    private static var dependencies: [String: Any] = [:]


    // Register a dependency with duplicate protection
    public static func register<T>(_ dependency: T, allowOverride: Bool = false) {
        let key = String(describing: T.self)
        
        if dependencies[key] == nil || allowOverride {
            dependencies[key] = dependency
        } else {
            assertionFailure("⚠️ Warning: Dependency '\(key)' is already registered. Skipping registration.")
        }
    }
    
    // Resolve a dependency
    public static func resolve<T>() -> T {
        let key = String(describing: T.self)
        
        guard let instance = dependencies[key] as? T else {
            preconditionFailure("❌ Dependency '\(key)' not found in the registry.")
        }
        return instance
    }
}

// Property wrapper for auto-injection
@propertyWrapper
public struct Dependency<T> {
    public var wrappedValue: T
    
    public init() {
        self.wrappedValue = DependencyRegistry.resolve()
    }
}
