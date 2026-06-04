import ArgumentParser

struct Start: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Start the container system."
    )

    mutating func run() throws {
        let arguments = ["system", "start"]
        try Runner.run(arguments)
    }
}