struct Service : Codable {
    let image: String?
    let build: Build?
    let ports: [String]?
    let environment: [String: String]?
    let volumes: [String]?
    let dependsOn: [String]?

    enum CodingKeys: String, CodingKey {
        case image
        case build
        case ports
        case environment
        case volumes
        case dependsOn = "depends_on"
    }
}