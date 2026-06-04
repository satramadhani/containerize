import ArgumentParser

struct Process: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "List all services.",
        aliases: ["list", "ls", "ps"]
    )

    mutating func run() throws {
        print("Listing services...")
    }
}