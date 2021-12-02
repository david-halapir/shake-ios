// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Shake",
    platforms: [.iOS(SupportedPlatform.IOSVersion.v12)],
    products: [
        .library(
            name: "Shake",
            targets: ["ShakeWrapper"]),
    ],
    dependencies: [
        .package(name: "SocketIO",
                 url: "https://github.com/socketio/socket.io-client-swift",
                 .upToNextMinor(from: "16.0.0")),
        .package(name: "KSCrash", url: "https://github.com/kstenerud/KSCrash", .upToNextMinor(from: "1.15.25"))
    ],
    targets: [
        .binaryTarget(name: "Shake",
                      path: "./Sources/Shake.xcframework"),
        .target(name: "ShakeWrapper",
                dependencies: [
                    .target(name: "Shake"),
                    .product(name: "SocketIO", package: "SocketIO"),
                    .product(name: "KSCrash", package: "KSCrash")
                ],
                path: "ShakeWrapper"),
    ]
)
