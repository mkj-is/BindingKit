// swift-tools-version:6.1

import PackageDescription

let package = Package(
    name: "BindingKit",
    platforms: [.iOS(.v13), .macOS(.v10_15), .tvOS(.v13), .watchOS(.v6)],
    products: [
        .library(
            name: "BindingKit",
            targets: ["BindingKit"])
    ],
    targets: [
        .target(
            name: "BindingKit",
            dependencies: []),
        .testTarget(
            name: "BindingKitTests",
            dependencies: ["BindingKit"])
    ]
)
