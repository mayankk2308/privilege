// swift-tools-version:5.2
// Minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Privilege",
    products: [
        .library(
            name: "Privilege",
            targets: ["Privilege"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Privilege",
            dependencies: []),
        .testTarget(
            name: "PrivilegeTests",
            dependencies: ["Privilege"])
    ]
)
