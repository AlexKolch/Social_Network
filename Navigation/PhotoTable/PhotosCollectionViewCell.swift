//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Алексей Колыченков on 19.01.2023.
//

import UIKit

final class PhotosCollectionViewCell: UICollectionViewCell {
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


    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(photoImage)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            photoImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
