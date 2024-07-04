// Prototype
protocol Prototype {
    func clone() -> Prototype
}

class Comments: Prototype {

    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String

    init(postId: Int, id: Int, name: String, email: String, body: String) {
        self.postId = postId
        self.id = id
        self.name = name
        self.email = email
        self.body = body
    }

    func clone() -> Prototype {
        return Comments(
            postId: postId,
            id: id, name: name,
            email: email,
            body: body
        )
    }
}

let commentPrototype = Comments(
    postId: 1,
    id: 1,
    name: "id labore ex et quam laborum",
    email: "id labore ex et quam laborum",
    body: "id labore ex et quam laborum"
)

var comment = commentPrototype.clone() as! Comments
