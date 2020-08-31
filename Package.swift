// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "data-structures-and-algorithms",
    products: [
        .executable(name: "DataStructuresAndAlgorithms", targets: ["DataStructuresAndAlgorithms"])
    ],
    targets: [
        .target(name: "DataStructuresAndAlgorithms"),
        .testTarget(name: "DataStructuresAndAlgorithmsTests", dependencies: ["DataStructuresAndAlgorithms"])
    ]
)
