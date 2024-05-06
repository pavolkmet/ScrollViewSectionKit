// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ScrollViewSectionKit",
    platforms: [
        .iOS(.v14),
        .watchOS(.v7),
        .tvOS(.v14),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "ScrollViewSectionKit",
            targets: ["ScrollViewSectionKit"]
        ),
    ],
    targets: [
        .target(
            name: "ScrollViewSectionKit",
            dependencies: [],
            resources: [
                .process("PrivacyInfo.xcprivacy")
            ]
        )
    ]
)
