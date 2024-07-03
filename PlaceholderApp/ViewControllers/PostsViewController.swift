import UIKit

class PostsViewController: UIViewController, UITableViewDataSource {

    var post = [Post]()
    var tableView: UITableView!

    override func loadView() {
            super.loadView()

            let tableView = UITableView(frame: .zero, style: .plain)
            tableView.register(PostCell.self, forCellReuseIdentifier: "Post")
            tableView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(tableView)
            NSLayoutConstraint.activate([
            self.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: tableView.topAnchor),
                self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
                self.view.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
                self.view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            ])
            self.tableView = tableView
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        getPosts()
    }
    
    private func getPosts() {
        ApiClient.shared.getPostDate { [weak self] (post) in
            guard let self = self else { return }
            switch post {
            case let .success(data):
                self.post = data
            case let .failure(error):
                print(error.localizedDescription)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Post", for: indexPath)
        let post = post[indexPath.row]
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.body
        cell.backgroundColor = .systemGray
        return cell
    }
}

class PostCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        self.initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }

    func initialize() {}

    override func prepareForReuse() {
        super.prepareForReuse()

        self.textLabel?.text = nil
        self.detailTextLabel?.text = nil
    }
}
