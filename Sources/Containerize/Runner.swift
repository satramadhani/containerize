import Foundation

struct Runner {
    static func run(_ arguments: [String]) throws {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/local/bin/container")
        process.arguments = arguments

        try process.run()
        process.waitUntilExit()
    }
}