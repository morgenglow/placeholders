enum NetworkError: Error {
    case emptyData
    case wrongJson
    case unableToParse
    case serverError
}
