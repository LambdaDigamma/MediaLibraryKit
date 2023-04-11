// swift-tools-version:5.7

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
        .package(url: "https://github.com/kean/Nuke.git", from: "11.0.0"),
        .package(url: "https://github.com/makleso6/NukeWebP", from: "1.0.2"),
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "MediaLibraryKit",
            dependencies: [
                .product(name: "Nuke", package: "Nuke"),
                .product(name: "NukeUI", package: "Nuke"),
                .product(name: "NukeWebP", package: "NukeWebP"),
                .product(name: "NukeWebPBasic", package: "NukeWebP")
            ]
        ),
        .testTarget(
            name: "MediaLibraryKitTests",
            dependencies: ["MediaLibraryKit"]
        ),
    ]
)
