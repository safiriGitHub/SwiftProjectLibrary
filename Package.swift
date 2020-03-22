// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftProjectLibrary",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "SwiftProjectLibrary",
            targets: ["SwiftProjectLibrary"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        //.package(url: "https://github.com/SnapKit/SnapKit.git", from: "4.0.0"),
        //.package(url: "https://github.com/SnapKit/SnapKit.git", Package.Dependency.Requirement._exactItem("4.2.0")),
        .package(url: "https://github.com/safiriGitHub/SnapKit.git", Package.Dependency.Requirement._branchItem("safiri420"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "SwiftProjectLibrary",
            dependencies: ["SnapKit"]),
        .testTarget(
            name: "SwiftProjectLibraryTests",
            dependencies: ["SwiftProjectLibrary"]),
    ],
    swiftLanguageVersions: [.v4, .v5]
)
