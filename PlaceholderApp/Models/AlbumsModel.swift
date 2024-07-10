struct Albums: Codable {
    var userId: Int
    var id: Int
    var title: String


    static func printEachItemTitle(array: [Albums]) -> () {
        var iterator = ArrayIterator(array: array)
        while iterator.hasNext() {
            print(iterator.next()!.title)
        }
    }
}
