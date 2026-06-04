import ArgumentParser

struct Up: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Start all services."
    )

    mutating func run() throws {
        print("Starting services...")
    }
}