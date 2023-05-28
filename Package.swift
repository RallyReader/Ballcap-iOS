// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Ballcap",
    platforms: [.iOS(.v14), .macOS(.v11)],
    products: [
        .library(
            name: "Ballcap",
            targets: ["Ballcap"]),
    ],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", .upToNextMajor(from: "10.9.0"))
    ],
    targets: [
        .target(
            name: "Ballcap",
            dependencies: [
                .product(name: "FirebaseFirestore", package: "firebase-ios-sdk"),
                .product(name: "FirebaseStorage", package: "firebase-ios-sdk"),
                .product(name: "FirebaseFirestoreSwift", package: "firebase-ios-sdk")
            ]
        ),
        .testTarget(
            name: "BallcapTests",
            dependencies: [
                "Ballcap",
                .product(name: "FirebaseFirestore", package: "firebase-ios-sdk"),
                .product(name: "FirebaseStorage", package: "firebase-ios-sdk"),
                .product(name: "FirebaseFirestoreSwift", package: "firebase-ios-sdk")
            ],
            resources: [
                .copy("GoogleService-Info.plist")
            ]
        )
    ]
)
