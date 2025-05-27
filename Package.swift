// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "SecuredCallsVideoSDK",
	platforms: [
		.iOS(.v16)
	],
	products: [
		.library(
			name: "SecuredCallsVideoSDK",
			targets: ["SecuredCallsVideoSDKWrapper"]
		)
	],
	dependencies: [
		.package(url: "https://github.com/Swinject/Swinject.git", from: "2.9.1"),
		.package(url: "https://github.com/Swinject/SwinjectAutoregistration.git", from: "2.8.4")
	],
	targets: [
		.binaryTarget(
			name: "SecuredCallsVideoSDKBinary",
			path: "SDK/SecuredCallsVideoSDK.xcframework"
		),
		.target(
			name: "SecuredCallsVideoSDKWrapper",
			dependencies: [
				"SecuredCallsVideoSDKBinary",
				.product(name: "Swinject", package: "Swinject"),
				.product(name: "SwinjectAutoregistration", package: "SwinjectAutoregistration")
			],
			path: "./Sources/SecuredCallsVideoSDKWrapper"
		)
	]
)
