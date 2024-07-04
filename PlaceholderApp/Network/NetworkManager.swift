import Foundation

// Singleton
enum API{
    static let baseURL = URL(string: "https://jsonplaceholder.typicode.com")
}

class NetworkManager {
    private static var sharedNetworkManager: NetworkManager = {
        let networkManager = NetworkManager(baseURL: API.baseURL!)
        return networkManager
    }()

    let baseURL: URL

    private init(baseURL: URL) {
        self.baseURL = baseURL
    }

    class func shared() -> NetworkManager {
        return sharedNetworkManager
    }
}
