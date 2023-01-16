
import UIKit

class PhotosTableViewCell: UITableViewCell  {
    static let identifier = "photoTableVCell"
    private let photos = DataPhoto.identifier.photos
    
    private let photoLabel: UILabel = {
        let labelView = UILabel()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.text = "Photos"
        labelView.font = UIFont.boldSystemFont(ofSize: 24)
        labelView.textColor = .black
        return labelView
    }()

    private let rightArrowImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "arrow.right")
        imageView.tintColor = .black
        return imageView
    }()

    private let photosStackViewImage: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(photoLabel, rightArrowImage, photosStackViewImage)
        setPhotosStack()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PhotosTableViewCell {

    private func setPhotos(index: Int)-> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: photos[index])
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        return imageView
    }

    private func setPhotosStack() {
        for index in 0..<4 {
            let photo = setPhotos(index: index)
            photosStackViewImage.addArrangedSubview(photo)
            NSLayoutConstraint.activate([
                photo.widthAnchor.constraint(equalToConstant: 120),
                photo.heightAnchor.constraint(equalTo: photo.widthAnchor),
            ])
        }
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            photoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photoLabel.bottomAnchor.constraint(equalTo: photosStackViewImage.topAnchor, constant: -12),

            rightArrowImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            rightArrowImage.centerYAnchor.constraint(equalTo: photoLabel.centerYAnchor),
            rightArrowImage.heightAnchor.constraint(equalToConstant: 30),
            rightArrowImage.widthAnchor.constraint(equalToConstant: 30),

            photosStackViewImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photosStackViewImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            photosStackViewImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        ])
    }
}
