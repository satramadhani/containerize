enum URLResolverError: Error, CustomStringConvertible {
    case fileNotFound(String)
    case noDefaultFileFound

    var description: String {
        switch self {
        case .fileNotFound(let path):
            return "\(path) does not exist."
        case .noDefaultFileFound:
            return "No docker-compose.yml or containerize.yml found in current directory."
        }
    }
}