class ToDo: TemplateActions, Codable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool

    init(userId: Int, id: Int, title: String, completed: Bool) {
        self.userId = userId
        self.id = id
        self.title = title
        self.completed = completed
    }

    override func actionInProcess() {
        print(self.title)
    }
}
