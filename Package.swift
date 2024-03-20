// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NGFirebaseConfiguration",
    platforms: [.iOS(.v17), .macOS(.v14), .watchOS(.v10), .tvOS(.v17), .macCatalyst(.v17), .visionOS(.v1)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "NGFirebaseConfiguration",
            targets: ["NGFirebaseConfiguration"]),
    ],
    dependencies: [
      .package(url: "https://github.com/firebase/firebase-ios-sdk.git", .upToNextMajor(from: "10.4.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "NGFirebaseConfiguration",
            dependencies:[
              .product(name: "FirebaseFirestoreSwift", package: "firebase-ios-sdk"),
              .product(name: "FirebaseDatabaseSwift", package: "firebase-ios-sdk"),
              .product(name: "FirebaseAuth", package: "firebase-ios-sdk"),
              .product(name: "FirebaseFunctions", package: "firebase-ios-sdk"),
              .product(name: "FirebaseStorage", package: "firebase-ios-sdk"),
            ]),
        .testTarget(
            name: "NGFirebaseConfigurationTests",
            dependencies: ["NGFirebaseConfiguration"]),
    ]
)
