// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "appinio_social_share",
    platforms: [
        .iOS("12.0")
    ],
    products: [
        .library(name: "appinio-social-share", targets: ["appinio_social_share"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
        // CocoaPods pins FBSDKCoreKit / FBSDKShareKit to exactly 18.0.0, the
        // version facebook_app_events pulls; SwiftPM allows 18.x (>= 18.0.0,
        // < 19.0.0) so the app resolves one facebook-ios-sdk for both.
        .package(url: "https://github.com/facebook/facebook-ios-sdk", from: "18.0.0")
    ],
    targets: [
        .target(
            name: "appinio_social_share",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                .product(name: "FacebookCore", package: "facebook-ios-sdk"),
                .product(name: "FacebookShare", package: "facebook-ios-sdk")
            ]
        )
    ]
)
