// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "secp256k1",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "secp256k1",
            targets: ["secp256k1"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "secp256k1",
            path: ".",
            sources: ["src/secp256k1.c"],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("src"),
                .headerSearchPath("."),
                .define("ENABLE_MODULE_ECDH"),
                .define("ENABLE_MODULE_RECOVERY"),
                .define("USE_NUM_NONE"),
                .define("USE_FIELD_INV_BUILTIN"),
                .define("USE_SCALAR_INV_BUILTIN"),
                .define("USE_FIELD_10X26"),
                .define("USE_SCALAR_8X32"),
                .define("ECMULT_GEN_PREC_BITS", to: "4"),
                .define("ECMULT_WINDOW_SIZE", to: "15"),
            ]
        ),
        .testTarget(
            name: "secp256k1Tests",
            dependencies: ["secp256k1"]),
    ]
)
