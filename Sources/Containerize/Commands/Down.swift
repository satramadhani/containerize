import ArgumentParser

struct Down: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Stop all services."
    )

    mutating func run() throws {
        print("Stopping services...")
    }
}