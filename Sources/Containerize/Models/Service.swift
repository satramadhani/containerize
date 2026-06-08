struct Service : Codable {
    let image: String?
    let build: Build?
    let ports: [String]?
    let envFile: String?
    let environment: [String: String]?
    let volumes: [String]?
    let dependsOn: [String]?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if container.contains(.image) {
            image = try container.decode(String.self, forKey: .image)
            build = nil
        } else if container.contains(.build) {
            build = try container.decode(Build.self, forKey: .build)
            image = nil
        } else {
            build = nil
            image = nil
        }

        if container.contains(.environment) {
            var parsed: [String: String] = [:]
            
            if let dict = try? container.decode([String: String].self, forKey: .environment) {
                parsed = dict
            } else if let array = try? container.decode([String].self, forKey: .environment) {
                for entry in array {
                    let parts = entry.split(separator: "=", maxSplits: 1)
                    if parts.count == 2 {
                        parsed[String(parts[0])] = String(parts[1])
                    }
                }
            }

            environment = parsed
        } else {
            environment = nil
        }
        
        envFile = try container.decodeIfPresent(String.self, forKey: .envFile)
        ports = try container.decodeIfPresent([String].self, forKey: .ports)
        volumes = try container.decodeIfPresent([String].self, forKey: .volumes)
        dependsOn = try container.decodeIfPresent([String].self, forKey: .dependsOn)
    }

    enum CodingKeys: String, CodingKey {
        case image
        case build
        case ports
        case envFile = "env_file"
        case environment
        case volumes
        case dependsOn = "depends_on"
    }
}