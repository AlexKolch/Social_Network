//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Алексей Колыченков on 19.01.2023.
//

import UIKit

final class PhotoCollectionView: UICollectionViewCell {
    static let identifier = "PhotoCollectionCell"

    let photoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 6
        image.layer.masksToBounds = true
        image.clipsToBounds = true
        return image
    }()

    private let activityView: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: .large)
        activity.color = .systemBlue
        activity.hidesWhenStopped = true
        activity.translatesAutoresizingMaskIntoConstraints = false
        return activity
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(photoImage)
        contentView.addSubview(activityView)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(path: String) {
        activityView.startAnimating()
        guard let urlRequest = URL(string: path) else {return}
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let dataImage = data {
                DispatchQueue.main.async {
                    self.photoImage.image = UIImage(data: dataImage)
                    self.activityView.stopAnimating()
                }
            }
        }
        task.resume()
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            photoImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            activityView.centerXAnchor.constraint(equalTo: photoImage.centerXAnchor),
            activityView.centerYAnchor.constraint(equalTo: photoImage.centerYAnchor)
        ])
    }
}
