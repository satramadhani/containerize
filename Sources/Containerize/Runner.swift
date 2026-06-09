import Foundation

struct Runner {    
    // TODO: Look for other solutions for shared mutable state.
    nonisolated(unsafe) static var runtimePath: String = "/usr/local/bin/container"

    static func run(_ arguments: [String]) throws {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: runtimePath)
        process.arguments = arguments

        try process.run()
        process.waitUntilExit()
    }

    static func runQuiet(_ arguments: [String]) throws {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: runtimePath)
        process.arguments = arguments
        process.standardError = FileHandle.nullDevice
        process.standardOutput = FileHandle.nullDevice

        try process.run()
        process.waitUntilExit()
    }
}