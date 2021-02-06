// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "MediaLibrary",
    platforms: [.iOS(.v14), .macOS(.v11), .watchOS(.v7), .tvOS(.v14)],
    products: [
        .library(
            name: "MediaLibrary",
            targets: ["MediaLibrary"]),
    ],
    dependencies: [
        .package(name: "Nuke", url: "https://github.com/kean/Nuke.git", .upToNextMajor(from: "9.0.0")),
        .package(name: "ImagePublisher", url: "https://github.com/kean/ImagePublisher.git", .upToNextMajor(from: "0.2.1")),
        .package(name: "FetchImage", url: "https://github.com/kean/FetchImage.git", .upToNextMajor(from: "0.3.0"))
    ],
    targets: [
        .target(
            name: "MediaLibrary",
            dependencies: ["Nuke", "ImagePublisher", "FetchImage"]),
        .testTarget(
            name: "MediaLibraryTests",
            dependencies: ["MediaLibrary"]),
    ]
)
