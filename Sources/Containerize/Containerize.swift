import ArgumentParser
import Foundation

@main
struct Containerize: ParsableCommand {
    @Option(
        name: .shortAndLong,
        help: "Path to the container runtime."
    )
    var runtime: String?

    static let configuration: CommandConfiguration = CommandConfiguration(
        abstract: "A personal 'docker compose'-inspired tool for Apple's container.",
        version: "0.0.1",
        subcommands: [
            Down.self,
            PS.self,
            Up.self,
            Start.self,
            Stop.self
        ]
    )

    mutating func run() throws {
        let envPath = ProcessInfo.processInfo.environment["CONTAINER_PATH"]
        Runner.runtimePath = runtime ?? envPath ?? Runner.runtimePath
    }
}
