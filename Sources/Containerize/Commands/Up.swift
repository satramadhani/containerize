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
        let ordered = try DependencyResolver.resolve(compose.services)

        for name in ordered {
            let service = compose.services[name]!
            
            print("Starting \(name)...")
            var arguments = ["run", "--detach", "--name", name]

            if let ports = service.ports {
                for port in ports {
                    arguments += ["-p", port]
                }
            }

            if let env = service.envFile {
                arguments += ["--env-file", env]
            }

            if let environments = service.environment {
                for (key, value) in environments {
                    arguments += ["-e", "\(key)=\(value)"]
                }
            }

            let composeDirectory = path.deletingLastPathComponent()
            if let volumes = service.volumes {
                for volume in volumes {
                    let parts = volume.split(separator: ":", maxSplits: 1)
                    if parts.count == 2 {
                        let hostPath = String(parts[0])
                        let containerPath = String(parts[1])
                        let resolvedHost = composeDirectory.appendingPathComponent(hostPath).path

                        if !FileManager.default.fileExists(atPath: resolvedHost) {
                            try FileManager.default.createDirectory(atPath: resolvedHost, withIntermediateDirectories: true)
                        }

                        arguments += ["-v", "\(resolvedHost):\(containerPath)"]
                    } else {
                        arguments += ["-v", volume]
                    }
                }
            }

            arguments.append(service.image ?? "")
            try Runner.run(arguments)
        }
    }
}