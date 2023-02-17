//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Алексей Колыченков on 28.12.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    static let identifier = "postTableViewCellID"
    private var index = 0

    // MARK: - Properties
    let authorPost: UILabel = {
        let authorPost = UILabel()
        authorPost.font = UIFont.boldSystemFont(ofSize: 20)
        authorPost.textColor = .black
        authorPost.translatesAutoresizingMaskIntoConstraints = false
        return authorPost
    }()

    let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let postDescription: UILabel = {
        let description = UILabel()
        description.textColor = .systemGray
        description.font = .systemFont(ofSize: 14)
        description.numberOfLines = 0
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()

    lazy var likes: UILabel = {
        let likes = UILabel()
        likes.textColor = .black
        likes.font = .systemFont(ofSize: 16)
        likes.numberOfLines = 1
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(addLikes))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        likes.addGestureRecognizer(tapGesture)
        return likes
    }()

    let views: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 16)
        view.numberOfLines = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - setupCell
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(authorPost)
        addSubview(postImageView)
        addSubview(postDescription)
        addSubview(likes)
        addSubview(views)
        setConstraints()
    }

    func setupCell(with index: Int) {
        self.index = index

        authorPost.text = Posts.shared.posts[index].author.fullName
        postImageView.image = UIImage(named: Posts.shared.posts[index].image)
        postDescription.text = Posts.shared.posts[index].description
        likes.text = "likes: \(Posts.shared.posts[index].likes)"
        views.text = "Views: \(Posts.shared.posts[index].views)"
    }
    
    @objc func addLikes() {
        Posts.shared.posts[index].likes += 1
        likes.text = "likes: \(Posts.shared.posts[index].likes)"
    }
    // MARK: - Constraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            authorPost.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            authorPost.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            authorPost.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            postImageView.topAnchor.constraint(equalTo: authorPost.bottomAnchor, constant: 12),
            postImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            postImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            postImageView.heightAnchor.constraint(equalTo: widthAnchor),

            postDescription.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            postDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            postDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            likes.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            likes.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            likes.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),

            views.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            views.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            views.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}
