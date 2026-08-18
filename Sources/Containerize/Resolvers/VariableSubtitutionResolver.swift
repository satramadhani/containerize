import Foundation

struct VariableSubstitutionResolver {
    static func substitute(_ input: String, using variables: [String: String]) -> String {
        // Matches ${VAR} or ${VAR:-default}.
        let pattern = #"\$\{([A-Za-z_][A-Za-z0-9_]*)(:-([^}]*))?\}"#
        guard let regex = try? NSRegularExpression(pattern: pattern) else {
            return input
        }

        let nsInput = input as NSString
        var result = input
        
        let matches = regex.matches(in: input, range: NSRange(location: 0, length: nsInput.length))

        for match in matches.reversed() {
            let fullRange = match.range(at: 0)
            let keyRange = match.range(at: 1)
            let defaultRange = match.range(at: 3)

            let key = nsInput.substring(with: keyRange)
            let defaultValue = defaultRange.location != NSNotFound ? nsInput.substring(with: defaultRange) : ""

            let replacement = variables[key] ?? defaultValue
            result = (result as NSString).replacingCharacters(in: fullRange, with: replacement)
        }

        return result
    }
}