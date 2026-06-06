struct DependencyResolver {
    static func resolve(_ services: [String: Service]) throws -> [String] {
        var visiting: Set<String> = []
        var visited: Set<String> = []

        var result: [String] = []
        func visit(_ name: String) throws {
            if visited.contains(name) {
                return
            }

            if visiting.contains(name) {
                throw DependencyResolverError.cyclicDependency(name)
            }
            
            visiting.insert(name)
            
            if let dependencies = services[name]?.dependsOn {
                for dependency in dependencies {
                    try visit(dependency)
                }
            }

            visiting.remove(name)
            visited.insert(name)
            result.append(name)
        }

        for name in services.keys {
            try visit(name)
        }

        return result
    }
}