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
        .package(name: "Nuke", url: "https://github.com/kean/Nuke.git", .upToNextMajor(from: "10.0.0")),
        .package(name: "NukeUI", url: "https://github.com/kean/NukeUI.git", .upToNextMajor(from: "0.6.8")),
    ],
    targets: [
        .target(
            name: "MediaLibrary",
            dependencies: ["Nuke", "NukeUI"]
        ),
        .testTarget(
            name: "MediaLibraryTests",
            dependencies: ["MediaLibrary"]
        ),
    ]
)
