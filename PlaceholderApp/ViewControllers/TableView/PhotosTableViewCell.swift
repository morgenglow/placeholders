import UIKit
import Foundation

final class PhotosViewCell: UITableViewCell {

    static let Identifier = "Photos"

    private let titleTextLabel: UILabel = {
        var titleLabel = UILabel(frame: .zero)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.numberOfLines = 1
        return titleLabel
    }()

    private let descriptionTextLabel: UILabel = {
        var titleLabel = UILabel(frame: .zero)
        titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        titleLabel.numberOfLines = 0
        return titleLabel
    }()

    private let cellImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = .gray
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    private func setupCell() {
        contentView.addSubview(titleTextLabel)
        contentView.addSubview(descriptionTextLabel)
        contentView.addSubview(cellImageView)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        cellImageView.layer.masksToBounds = true
        cellImageView.layer.cornerRadius = 4
        cellImageView.layer.borderColor = UIColor.gray.cgColor
        cellImageView.layer.borderWidth = 1.0
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleTextLabel.text = ""
        descriptionTextLabel.text = ""
        cellImageView.image = nil
    }

    func configure(with model: Photo) {
        titleTextLabel.text = model.title
        descriptionTextLabel.text = model.description
        cellImageView.imageFromServerURL(URLString: model.imagePath , placeHolder: nil)
        updateConstraints()
    }
}
