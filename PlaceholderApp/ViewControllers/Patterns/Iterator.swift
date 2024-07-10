// Iterator pattern
protocol Iterator {
    associatedtype Element
    func hasNext() -> Bool
    mutating func next() -> Element?
}

// concrete iterator for albums
struct ArrayIterator<Albums>: Iterator {
    private let array: [Albums]
    private var index = 0
    init(array: [Albums]) {
        self.array = array
    }
    func hasNext() -> Bool {
        return index < array.count
    }
    mutating func next() -> Albums? {
        if hasNext() {
            let element = array[index]
            index += 1
            return element
        }
        return nil
    }
}
