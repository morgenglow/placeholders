import Foundation


protocol NetworkServiceProtocol {
    func getPostDate(completion: @escaping (Result<[Post], NetworkError>) -> Void)
    func getAlbumDate(completion: @escaping (Result<[Albums], NetworkError>) -> Void)
    func getTodoDate(completion: @escaping (Result<[ToDo], NetworkError>) -> Void)
}

final class ApiClient: NetworkServiceProtocol {

    static let shared = ApiClient()

    func getPostDate(completion: @escaping (Result<[Post], NetworkError>) -> Void) {
        guard let url = URL(string: Endpoints.posts) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if response == nil {
                completion(.failure(.emptyData))
                return
            }
            if let data = data {
                do {
                    let posts = try JSONDecoder().decode([Post].self, from: data)
                    completion(.success(posts))
                } catch {
                    completion(.failure(.wrongJson))
                }
            }
        }.resume()
    }

    func getAlbumDate(completion: @escaping (Result<[Albums], NetworkError>) -> Void) {
        guard let url = URL(string: Endpoints.albums) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if response == nil {
                completion(.failure(.emptyData))
                return
            }
            if let data = data {
                do {
                    let albums = try JSONDecoder().decode([Albums].self, from: data)
                    completion(.success(albums))
                } catch {
                    completion(.failure(.wrongJson))
                }
            }
        }.resume()
    }

    func getTodoDate(completion: @escaping (Result<[ToDo], NetworkError>) -> Void) {
        guard let url = URL(string: Endpoints.todos) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                completion(.failure(.emptyData))
                return
            }
            if let data = data {
                do {
                    let todo = try JSONDecoder().decode([ToDo].self, from: data)
                    completion(.success(todo))
                } catch {
                    completion(.failure(.wrongJson))
                }
            }
        }.resume()
    }

    func getPhotosDate(completion: @escaping (Result<[Photo], NetworkError>) -> Void) {
        guard let url = URL(string: Endpoints.photos) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                completion(.failure(.emptyData))
                return
            }
            if let data = data {
                do {
                    let todo = try JSONDecoder().decode([Photo].self, from: data)
                    completion(.success(todo))
                } catch {
                    completion(.failure(.wrongJson))
                }
            }
        }.resume()
    }
}
