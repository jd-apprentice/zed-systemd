// swift-tools-version:5.3

import Foundation
import PackageDescription

var sources = ["src/parser.c"]
if FileManager.default.fileExists(atPath: "src/scanner.c") {
    sources.append("src/scanner.c")
}

let package = Package(
    name: "TreeSitterSystemdService",
    products: [
        .library(name: "TreeSitterSystemdService", targets: ["TreeSitterSystemdService"]),
    ],
    dependencies: [
        .package(name: "SwiftTreeSitter", url: "https://github.com/tree-sitter/swift-tree-sitter", from: "0.9.0"),
    ],
    targets: [
        .target(
            name: "TreeSitterSystemdService",
            dependencies: [],
            path: ".",
            sources: sources,
            resources: [
                .copy("queries")
            ],
            publicHeadersPath: "bindings/swift",
            cSettings: [.headerSearchPath("src")]
        ),
        .testTarget(
            name: "TreeSitterSystemdServiceTests",
            dependencies: [
                "SwiftTreeSitter",
                "TreeSitterSystemdService",
            ],
            path: "bindings/swift/TreeSitterSystemdServiceTests"
        )
    ],
    cLanguageStandard: .c11
)
