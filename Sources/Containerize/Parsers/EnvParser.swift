import Foundation

struct EnvFileParser {
    static func parse(at url: URL) -> [String: String] {
        guard let contents = try? String(contentsOf: url, encoding: .utf8) else {
            return [:]
        }

        var result: [String: String] = [:]

        for line in contents.split(separator: "\n") {
            let trimmed = line.trimmingCharacters(in: .whitespaces)

            if trimmed.isEmpty || trimmed.hasPrefix("#") {
                continue
            }

            let parts = trimmed.split(separator: "=", maxSplits: 1)
            if parts.count == 2 {
                let key = String(parts[0]).trimmingCharacters(in: .whitespaces)
                let value = String(parts[1]).trimmingCharacters(in: .whitespaces)
                
                result[key] = value
            }
        }

        return result
    }
}

struct VariableSubstitutor {
    static func substitute(_ input: String, using variables: [String: String]) -> String {
        var result = input

        for (key, value) in variables {
            result = result.replacingOccurrences(of: "${\(key)}", with: value)
        }

        return result
    }
}