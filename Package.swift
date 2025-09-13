// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LuaScriptCore",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "LuaScriptCore-Swift",
            targets: ["LuaScriptCore-Swift"]),
        .library(
            name: "LuaScriptCore",
            targets: ["LuaScriptCore"]
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "LuaScriptCore-Swift",
            dependencies: ["LuaScriptCore"],
            path: "Source/iOS_OSX/Code-Swift",
            linkerSettings: [.linkedLibrary("z"), .linkedFramework("Foundation")]
        ),
        .target(
            name: "LuaScriptCore",
            path: "Source",
            sources: [
                "lua-core/src",
                "iOS_OSX/Code",
                "iOS_OSX/LSCConfig.h",
                "iOS_OSX/LSCConfig.m",
            ],
            publicHeadersPath: "iOS_OSX/Include",
            cSettings: [
                .headerSearchPath("lua-core/src"),
                .headerSearchPath("iOS_OSX/Code"),
                .headerSearchPath("iOS_OSX"),
                .define("TARGET_OS_MAC", to: "1"),
                .define("TARGET_OS_IPHONE", to: "0")
            ],
            linkerSettings: [.linkedLibrary("z"), .linkedFramework("Foundation")]
        ),
        
        .testTarget(
            name: "LuaScriptCore-Tests",
            dependencies: ["LuaScriptCore", "LuaScriptCore-Swift"]),
    ],
    cLanguageStandard: .gnu99,
    cxxLanguageStandard: .cxx11
)
