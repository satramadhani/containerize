import ArgumentParser
import Foundation

struct Up: ParsableCommand {
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
        abstract: "Start all services."
    )

    mutating func run() throws {
        let path = try URLResolver.resolve(file)
        let compose = try Parser.parse(from: path)

        for (name, service) in compose.services {
            print("Starting \(name)...")
            var arguments = ["run", "--detach", "--name", name, service.image ?? ""]

            if let ports = service.ports {
                for port in ports {
                    arguments += ["-p", port]
                }
            }

            if let environments = service.environment {
                for (key, value) in environments {
                    arguments += ["-e", "\(key)=\(value)"]
                }
            }

            try Runner.run(arguments)
        }
    }
}