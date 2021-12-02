// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Shake",
    platforms: [.iOS(SupportedPlatform.IOSVersion.v12)],
    products: [
        .library(
            name: "Shake",
            targets: ["ShakeWrapper"]),
    ],
    dependencies: [
        .package(name: "SocketIO",
                 url: "https://github.com/socketio/socket.io-client-swift",
                 .upToNextMinor(from: "16.0.0")),
    ],
    targets: [
        .binaryTarget(name: "Shake",
                      path: "./Sources/Shake.xcframework"),
        .target(name: "ShakeWrapper",
                dependencies: [
                    .target(name: "Shake"),
                    .product(name: "SocketIO", package: "SocketIO"),
                ],
                path: "ShakeWrapper"),
    ]
)

/**

 .package(name: "KSCrash", url: "https://github.com/kstenerud/KSCrash", .upToNextMinor(from: "1.15.25"))

 .product(name: "KSCrash", package: "KSCrash")

 linkerSettings: [
   .linkedFramework("MessageUI", nil),
   .linkedFramework("SystemConfiguration", nil),
   .linkedLibrary("libc++", nil),
   .linkedLibrary("libz", nil),
 ]

 */

/*

let package = Package(
  name: "Firebase",
  platforms: [.iOS(.v11), .macOS(.v10_12), .tvOS(.v12), .watchOS(.v7)],
  products: [
    .library(
      name: "FirebaseAnalytics",
      targets: ["FirebaseAnalyticsTarget"]
    )
  ],
  dependencies: [
    .package(
      name: "GoogleAppMeasurement",
      url: "https://github.com/google/GoogleAppMeasurement.git",
      // Note that CI changes the version to the head of main for CI.
      // See scripts/setup_spm_tests.sh.
      .exact("8.9.1")
    ),
  ],

  targets: [
    .target(
      name: "Firebase",
      path: "CoreOnly/Sources",
      publicHeadersPath: "./"
    ),

    .target(
      name: "FirebaseCore",
      dependencies: [
        "Firebase",
        "FirebaseCoreDiagnostics",
        .product(name: "GULEnvironment", package: "GoogleUtilities"),
        .product(name: "GULLogger", package: "GoogleUtilities"),
      ],
      path: "FirebaseCore/Sources",
      publicHeadersPath: "Public",
      cSettings: [
        .headerSearchPath("../.."),
        // TODO: - Add support for cflags cSetting so that we can set the -fno-autolink option
      ],
      linkerSettings: [
        .linkedFramework("UIKit", .when(platforms: [.iOS, .tvOS])),
        .linkedFramework("AppKit", .when(platforms: [.macOS])),

      ]
    ),



    .target(
      name: "FirebaseAnalyticsTarget",
      dependencies: [.target(name: "FirebaseAnalyticsWrapper",
                             condition: .when(platforms: [.iOS, .macOS, .tvOS]))],
      path: "SwiftPM-PlatformExclude/FirebaseAnalyticsWrap"
    ),

    .target(
      name: "FirebaseAnalyticsWrapper",
      dependencies: [
        .target(name: "FirebaseAnalytics", condition: .when(platforms: [.iOS, .macOS, .tvOS])),
        .product(name: "GoogleAppMeasurement",
                 package: "GoogleAppMeasurement",
                 condition: .when(platforms: [.iOS, .macOS, .tvOS]))
      ],
      path: "FirebaseAnalyticsWrapper",

      linkerSettings: [
        .linkedLibrary("sqlite3"),
        .linkedLibrary("c++"),
        .linkedLibrary("z"),
        .linkedFramework("StoreKit"),
      ]
    ),

    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://dl.google.com/firebase/ios/swiftpm/8.9.1/FirebaseAnalytics.zip",
      checksum: "397688619b1d2eb2731fd06d094b95498e753519b4c0c75a6f7071bcafd9d1f1"
    ),

  ],
  cLanguageStandard: .c99,
  cxxLanguageStandard: CXXLanguageStandard.gnucxx14
)
*/
