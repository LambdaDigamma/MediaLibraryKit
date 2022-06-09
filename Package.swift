// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "MediaLibraryKit",
    platforms: [.iOS(.v14), .macOS(.v11), .watchOS(.v7), .tvOS(.v14)],
    products: [
        .library(
            name: "MediaLibraryKit",
            targets: ["MediaLibraryKit"]
        ),
    ],
    dependencies: [
        .package(name: "Nuke", url: "https://github.com/kean/Nuke.git", .upToNextMajor(from: "10.0.0")),
        .package(name: "NukeUI", url: "https://github.com/kean/NukeUI.git", .upToNextMajor(from: "0.6.8")),
    ],
    targets: [
        .target(
            name: "MediaLibraryKit",
            dependencies: ["Nuke", "NukeUI"]
        ),
        .testTarget(
            name: "MediaLibraryKitTests",
            dependencies: ["MediaLibraryKit"]
        ),
    ]
)
