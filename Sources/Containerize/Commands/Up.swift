import ArgumentParser
import Foundation

struct Up: ParsableCommand {
    @Option(
        name: .shortAndLong,
        help:
            """
            Compose or Containerize file. If not specified, it will look for a file named 'containerize.yml' or \
            'docker-compose.yml' in the current directory.
            """
    )
    var file: String?

    static let configuration = CommandConfiguration(
        abstract: "Start all services."
    )

    mutating func run() throws {
        print("Starting services...")

        if (file == nil) {
            file = "docker-compose.yml"

            if !FileManager.default.fileExists(atPath: file!) {
                file = "containerize.yml"
            }

            if !FileManager.default.fileExists(atPath: file!) {
                print("No docker-compose.yml or containerize.yml found in current directory.")
                return
            }
        }

        if !FileManager.default.fileExists(atPath: file!) {
            print("\(file!) does not exist.")
            return
        }
        
        let compose = try Parser.parse(from: URL(fileURLWithPath: file!))
        dump(compose)
    }
}