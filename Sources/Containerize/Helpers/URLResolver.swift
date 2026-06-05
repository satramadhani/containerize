import Foundation

struct URLResolver {
    static func resolve(_ path: String?) throws -> URL {
        let resolvedPath: String

        if let path = path {
            guard FileManager.default.fileExists(atPath: path) else {
                throw URLResolverError.fileNotFound(path)
            }

            resolvedPath = path
        }
        else {
            if FileManager.default.fileExists(atPath: "docker-compose.yml") {
                resolvedPath = "docker-compose.yml"
            } else if FileManager.default.fileExists(atPath: "containerize.yml") {
                resolvedPath = "containerize.yml"
            } else {
                throw URLResolverError.noDefaultFileFound
            }
        }

        return URL(fileURLWithPath: resolvedPath)
    }
}