// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Resources",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Resources",
            targets: ["Resources"]),
        .library(
            name: "RecipeAssets",
            targets: ["RecipeAssets"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Resources"),
        .target(
            name: "RecipeAssets",
            dependencies: ["Resources"],
            resources: [
                .process("Sources/Resources")
            ]),
        .testTarget(
            name: "ResourcesTests",
            dependencies: ["Resources"]
        ),
    ]
)
