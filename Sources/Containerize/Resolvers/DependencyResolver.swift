struct DependencyResolver {
    static func resolve(_ services: [String: Service]) throws -> [String] {
        var result: [String] = []
        var visited: Set<String> = []

        func visit(_ name: String) {
            if visited.contains(name) {
                return
            }
            
            visited.insert(name)
            if let dependencies = services[name]?.dependsOn {
                for dependency in dependencies {
                    visit(dependency)
                }
            }

            result.append(name)
        }

        for name in services.keys {
            visit(name)
        }

        return result
    }
}