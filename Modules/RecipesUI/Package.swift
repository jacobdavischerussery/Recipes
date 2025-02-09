// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RecipesUI",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "RecipesUI",
            targets: ["RecipesUI"]),
    ],
    dependencies: [
        .package(path: "../RecipesFoundation"),
        .package(path: "../Dependencies"),
        .package(path: "../Networking"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "RecipesUI",
            dependencies: [
                "RecipesFoundation",
                "Dependencies",
                "Networking"]),
        .testTarget(
            name: "RecipesUITests",
            dependencies: ["RecipesUI"]
        ),
    ]
)
