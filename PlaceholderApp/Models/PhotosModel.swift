struct Photo: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}

struct DemoCellModel: Equatable, Hashable {
    let title: String
    let description: String?
    let imagePath: String?
}
