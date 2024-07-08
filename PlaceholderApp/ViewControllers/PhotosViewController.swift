import UIKit
import Foundation

class PhotosViewController: UIViewController, UITableViewDataSource {
    var photo = [Photo]()
    weak var photoTable: UITableView!

    override func loadView() {
            getPhotos()

            super.loadView()
            let tableView = UITableView(frame: .zero, style: .plain)
            tableView.register(PhotosViewCell.self, forCellReuseIdentifier: "Photos")
            tableView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(tableView)
            NSLayoutConstraint.activate([
            self.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: tableView.topAnchor),
                self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
                self.view.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
                self.view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            ])
            self.photoTable = tableView
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        photoTable.dataSource = self
    }

    private func getPhotos() {
        ApiClient.shared.getPhotosDate { [weak self] (photo) in
            guard let self = self else { return }
            switch photo {
            case let .success(data):
                self.photo = data
            case let .failure(error):
                print(error.localizedDescription)
            }
            DispatchQueue.main.async {
                self.photoTable.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Photos", for: indexPath) as! PhotosViewCell
        let photo = photo[indexPath.row]
        cell.configure(with: photo)
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photo.count
    }
}
