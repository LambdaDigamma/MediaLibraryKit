// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "MediaLibrary",
    platforms: [.iOS(.v13), .macOS(.v10_15), .watchOS(.v6), .tvOS(.v13)],
    products: [
        .library(
            name: "MediaLibrary",
            targets: ["MediaLibrary"]),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "MediaLibrary",
            dependencies: []),
        .testTarget(
            name: "MediaLibraryTests",
            dependencies: ["MediaLibrary"]),
    ]
)
