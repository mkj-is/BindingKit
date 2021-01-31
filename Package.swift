// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "BindingKit",
    platforms: [.iOS(.v13), .macOS(.v10_15), .tvOS(.v13), .watchOS(.v6)],
    products: [
        .library(
            name: "BindingKit",
            targets: ["BindingKit"]),
    ],
    targets: [
        .target(
            name: "BindingKit",
            dependencies: []),
        .testTarget(
            name: "BindingKitTests",
            dependencies: ["BindingKit"]),
    ]
)
