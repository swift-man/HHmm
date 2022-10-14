// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HHmm",
    products: [
        .library(
            name: "HHmm",
            targets: ["HHmm"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "HHmm",
            dependencies: [],
            path: "Sources/HHmm",
            exclude: ["Info.plist"]),
        .testTarget(
            name: "HHmmTests",
            dependencies: ["HHmm"],
            path: "Tests/HHmmTests",
            exclude: ["Info.plist"]),
    ]
)
