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
        .package(url: "https://github.com/kean/Nuke.git", from: "10.0.0"),
        .package(url: "https://github.com/kean/NukeUI.git", from: "0.6.8"),
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
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
