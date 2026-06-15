enum UpError : Error, CustomStringConvertible {
    case envFileNotFound(String)

    var description: String {
        switch self {
        case .envFileNotFound(let path):
            return "env file not found in \(path)."
        }
    }
}