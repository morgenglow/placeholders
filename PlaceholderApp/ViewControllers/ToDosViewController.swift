import UIKit

class ToDosViewController: UIViewController, UITableViewDataSource {
    var todo = [ToDo]()
    weak var todoTable: UITableView!

    override func loadView() {
            super.loadView()

            let tableView = UITableView(frame: .zero, style: .plain)
            tableView.register(TodoCell.self, forCellReuseIdentifier: "Todo")
            tableView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(tableView)
            NSLayoutConstraint.activate([
            self.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: tableView.topAnchor),
                self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
                self.view.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
                self.view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            ])
            self.todoTable = tableView
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        todoTable.dataSource = self
        getTodos()
    }

    private func getTodos() {
        ApiClient.shared.getTodoDate { [weak self] (todo) in
            guard let self = self else { return }
            switch todo {
            case let .success(data):
                self.todo = data
            case let .failure(error):
                print(error.localizedDescription)
            }
            DispatchQueue.main.async {
                self.todoTable.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Todo", for: indexPath)
        let todo = todo[indexPath.row]
        var completed: String = ""
        todo.completed ? (completed = "completed") : (completed = "not completed")
        cell.textLabel?.text = todo.title
        cell.detailTextLabel?.text = completed + " by user " + String(todo.userId)
        cell.backgroundColor = .systemGray5
        return cell
    }

    class TodoCell: UITableViewCell {

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
}

