enum DependencyResolverError : Error, CustomStringConvertible {
    case cyclicDependency(String)

    var description: String {
        switch self {
        case .cyclicDependency(let name):
            return "Cyclic dependency: \(name)"
        }
    }
}