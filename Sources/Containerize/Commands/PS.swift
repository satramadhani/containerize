import ArgumentParser

struct PS: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "List all running services.",
        aliases: ["list", "ls", "process"]
    )

    mutating func run() throws {
        try Runner.run(["ls"])
    }
}