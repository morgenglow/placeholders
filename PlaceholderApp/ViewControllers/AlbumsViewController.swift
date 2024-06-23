import UIKit

class AlbumsViewController: UIViewController, UITableViewDataSource {
    var album = [Albums]()
    weak var albumTable: UITableView!

    override func loadView() {
            super.loadView()

            let tableView = UITableView(frame: .zero, style: .plain)
            tableView.register(AlbumCell.self, forCellReuseIdentifier: "Album")
            tableView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(tableView)
            NSLayoutConstraint.activate([
            self.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: tableView.topAnchor),
                self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
                self.view.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
                self.view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            ])
            self.albumTable = tableView
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        albumTable.dataSource = self
        getAlbums()
    }

    private func getAlbums() {
        ApiClient.shared.getAlbumDate { [weak self] (album) in
            guard let self = self else { return }
            switch album {
            case let .success(data):
                self.album = data
            case let .failure(error):
                print(error.localizedDescription)
            }
            DispatchQueue.main.async {
                self.albumTable.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return album.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Album", for: indexPath)
        let album = album[indexPath.row]
        cell.textLabel?.text = String(album.id)
        cell.detailTextLabel?.text = album.title
        cell.backgroundColor = .systemGray
        return cell
    }

    class AlbumCell: UITableViewCell {

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

