struct Endpoints {
    static let BASE_URL = "https://jsonplaceholder.typicode.com/"

    struct Albums {
        static let albums: String = "\(BASE_URL)/albums"
    }


    struct Posts {
        static let posts: String = "\(BASE_URL)/posts"
    }

    struct ToDos {
        static let todos: String = "\(BASE_URL)/todos"
    }
}
