struct Endpoints {
    static let albums: String = "\(NetworkManager.shared().baseURL)/albums"
    static let posts: String = "\(NetworkManager.shared().baseURL)/posts"
    static let todos: String = "\(NetworkManager.shared().baseURL)/todos"
    static let photos: String = "\(NetworkManager.shared().baseURL)/photos"
}
