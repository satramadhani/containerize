import ArgumentParser

@main
struct Containerize: ParsableCommand {
    static let configuration: CommandConfiguration = CommandConfiguration(
        abstract: "A personal 'docker compose'-inspired tool for Apple's container.",
        version: "0.0.1",
        subcommands: [
            Down.self,
            PS.self,
            Up.self,
        ]
    )
}
