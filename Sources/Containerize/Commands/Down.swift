import ArgumentParser
import Foundation

struct Down: ParsableCommand {
    @Option(
        name: .shortAndLong,
        help:
            """
            Compose or Containerize file. If not specified, it will look for a file named 'docker-compose.yml' or \
            'containerize.yml' in the current directory.
            """
    )
    var file: String?

    static let configuration = CommandConfiguration(
        abstract: "Stop all services."
    )

    mutating func run() throws {
        let path = try URLResolver.resolve(file)
        let compose = try Parser.parse(from: path)

        for (name, _) in compose.services {
            print("Stopping \(name)...")
            try Runner.run(["stop", name])
        }
    }
}