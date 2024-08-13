import ProjectDescription

let projectName: String = "MovieInfo"

let project = Project(
    name: projectName,
    organizationName: "com.bhoon.tuistMovieInfo",
    settings: nil,
    targets: [
        Target(
            name: projectName,
            platform: .iOS,
            product: .app,
            bundleId: "com.bhoon.tuistMovieInfo",
            infoPlist: .default,
            sources: ["MovieInfo/Source/**"],
            resources: "MovieInfo/Resources/**",
            dependencies: [],
            settings: nil
        )
    ]
)
