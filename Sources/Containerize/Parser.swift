import Foundation
import Yams

struct Parser {
    static func parse(from url: URL) throws -> Compose {
        var contents = try String(contentsOf: url, encoding: .utf8)

        let env = url.deletingLastPathComponent().appendingPathComponent(".env")
        if FileManager.default.fileExists(atPath: env.path) {
            let variables = EnvFileParser.parse(at: env)
            contents = VariableSubstitutionResolver.substitute(contents, using: variables)
        }

        let result = try YAMLDecoder().decode(Compose.self, from: contents)
        return result
    }
}