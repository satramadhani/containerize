import ArgumentParser

struct Stop: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Stop the container system."
    )

    mutating func run() throws {
        let arguments = ["system", "stop"]
        try Runner.run(arguments)
    }
}