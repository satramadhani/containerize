import Foundation
import Yams

struct Parser {
    static func parse(from url: URL) throws -> Compose {
        let contents = try String(contentsOf: url, encoding: .utf8)

        let result = try YAMLDecoder().decode(Compose.self, from: contents)
        return result
    }
}