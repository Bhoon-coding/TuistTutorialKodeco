import ProjectDescription

let projectName: String = "MovieInfo"
let projectSettings: Settings = .settings(configurations: [
    .debug(name: "Debug", xcconfig: "config/MovieInfoProject.xcconfig"),
    .release(name: "Release", xcconfig: "config/MovieInfoProject.xcconfig"),
])
let targetSettigns: Settings = .settings(configurations: [
    .debug(name: "Debug", xcconfig: "config/MovieInfoTarget.xcconfig"),
    .release(name: "Release", xcconfig: "config/MovieInfoTarget.xcconfig")
])

let project = Project(
    name: projectName,
    organizationName: "com.bhoon.tuistMovieInfo",
    // package 추가
    packages: [
        .package(
            url: "https://github.com/onevcat/Kingfisher", // url 입력
            .upToNextMajor(from: "7.12.0") // 다음 major까지 해당 버전을 사용하게 설정
        )
    ],
    settings: projectSettings,
    targets: [
        Target(
            name: projectName,
            platform: .iOS,
            product: .app,
            bundleId: "com.bhoon.tuistMovieInfo",
            infoPlist: .default,
            sources: ["MovieInfo/Source/**"],
            resources: "MovieInfo/Resources/**",
            dependencies: [
                .project(
                    target: "NetworkKit",
                    path: .relativeToManifest("NetworkKit")
                ),
                .package(product: "Kingfisher")
//                .external(name: "Kingfisher")
            ],
            settings: targetSettigns
        ),
        // Test 추가
        Target(
            name: "MovieInfoTests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "com.bhoon.tuistMovieInfoTests",
            infoPlist: "MovieInfoTests/Resources/Info.plist",
            sources: ["MovieInfoTests/Source/**"],
            dependencies: [
                .target(name: "MovieInfo")
            ]
        )
    ]
)
