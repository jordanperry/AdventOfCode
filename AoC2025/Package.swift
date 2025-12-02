// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AoC2025",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AoC2025",
            targets: ["AoC2025"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-numerics", branch: "main"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AoC2025",
            dependencies: [
                .product(name: "Numerics", package: "swift-numerics")
            ]
        ),
        .testTarget(
            name: "AoC2025Tests",
            dependencies: ["AoC2025"],
            resources: [
                .process("Resources")
            ]
        ),
    ]
)
