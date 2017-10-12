// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Risk",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "Risk",
            targets: ["Risk"]),
        .library(
            name: "Tcp",
            targets: ["Tcp"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Risk",
            dependencies: ["Tcp"]),
        .target(
            name: "Tcp",
            dependencies: ["LibC"]),
        .target(name: "LibC"),
        .testTarget(
            name: "RiskTests",
            dependencies: ["Risk"]),
        .testTarget(
            name: "TcpTests",
            dependencies: ["Tcp"]),
    ]
)
