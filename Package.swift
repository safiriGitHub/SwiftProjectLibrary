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
        //.package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.0.0"),
        //.package(url: "https://github.com/SnapKit/SnapKit.git", Package.Dependency.Requirement._exactItem("4.2.0")),
        .package(url: "https://gitee.com/safiri/SnapKit.git", Package.Dependency.Requirement.exactItem("4.2.1")),
        //.package(url: "https://github.com/safiriGitHub/OCProjectLibrary.git", Package.Dependency.Requirement._branchItem("master")),
        .package(url: "https://gitee.com/safiri/Hue.git", from: "5.0.0"),
        //.package(url: "https://github.com/safiriGitHub/Kingfisher.git", from: "5.13.4")
        .package(url: "https://gitee.com/mirrors/alamofire.git", from: "4.9.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "SwiftProjectLibrary",
            //dependencies: ["SnapKit", "OCProjectLibrary"]
            dependencies: ["SnapKit", "Hue", "Alamofire"]
        ),
        .testTarget(
            name: "SwiftProjectLibraryTests",
            dependencies: ["SwiftProjectLibrary"]),
    ],
    swiftLanguageVersions: [.v4, .v5]
)
