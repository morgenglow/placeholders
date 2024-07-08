// Adapter example
class Photo: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String

    init(albumId: Int, id: Int, title: String, url: String, thumbnailUrl: String) {
        self.albumId = albumId
        self.id = id
        self.title = title
        self.url = url
        self.thumbnailUrl = thumbnailUrl
    }
}

protocol CellModel {
    var title: String { get }
    var description: String { get }
    var imagePath: String { get }
}

extension Photo: CellModel {
    var description: String {
        return self.title
    }

    var imagePath: String {
        return self.url
    }
}
