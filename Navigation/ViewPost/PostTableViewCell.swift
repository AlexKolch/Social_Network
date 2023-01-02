//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Алексей Колыченков on 28.12.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    static let identifier = "postTableViewCellID"

    let authorPost: UILabel = {
        let authorPost = UILabel()
        authorPost.text = ""
        authorPost.font = UIFont.boldSystemFont(ofSize: 20)
        authorPost.textColor = .black
        authorPost.translatesAutoresizingMaskIntoConstraints = false
        return authorPost
    }()

    let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let postDescription: UILabel = {
        let description = UILabel()
        description.text = ""
        description.textColor = .systemGray
        description.font = .systemFont(ofSize: 14)
        description.numberOfLines = 0
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()

    let likes: UILabel = {
        let likes = UILabel()
        likes.textColor = .black
        likes.font = .systemFont(ofSize: 16)
        likes.numberOfLines = 1
        likes.translatesAutoresizingMaskIntoConstraints = false
        return likes
    }()

    let view: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 16)
        view.numberOfLines = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(authorPost)
        addSubview(postImageView)
        addSubview(postDescription)
        addSubview(likes)
        addSubview(view)
        setConstraints()
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            authorPost.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            authorPost.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            authorPost.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            postImageView.topAnchor.constraint(equalTo: authorPost.bottomAnchor, constant: 12),
            postImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            postImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: trailingAnchor),

            postDescription.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            postDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            likes.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            likes.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            likes.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),

            view.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }

}

