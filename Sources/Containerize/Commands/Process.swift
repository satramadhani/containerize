import ArgumentParser

struct Process: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "List all services."
    )

    mutating func run() throws {
        print("Listing services...")
    }
}