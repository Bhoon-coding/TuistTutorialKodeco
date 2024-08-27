import ProjectDescription

let projectSettings: Settings = .settings(configurations: [
    .debug(name: "Debug", xcconfig: "config/NetworkKitProject.xcconfig"),
    .release(name: "Release", xcconfig: "config/NetworkKitProject.xcconfig")
])

let targetSettigns: Settings = .settings(configurations: [
    .debug(name: "Debug", xcconfig: "config/NetworkKitTarget.xcconfig"),
    .release(name: "Release", xcconfig: "config/NetworkKitTarget.xcconfig"),
])

let project = Project(
    name: "NetworkKit",
    organizationName: "Ray Wenderlich",
    settings: projectSettings,
    targets: [
        Target(
            name: "NetworkKit",
            platform: .iOS,
            product: .framework,
            bundleId: "io.tuist.starterManifests",
            infoPlist: "NetworkKit/Info.plist",
            sources: ["NetworkKit/Source/**"],
            settings: targetSettigns
        )
    ]
)
