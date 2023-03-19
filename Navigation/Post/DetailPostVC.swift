//
//  PostViewController.swift
//  Navigation
//
//  Created by Алексей Колыченков on 15.02.2023.
//

import UIKit

protocol SendImageDelegate: AnyObject {
    func sendImagePost(for path: String)
    }

class PostsViewController: UIViewController, SendImageDelegate {
    private let photos = DataPhoto.shared.urlImages
    var post: DataPost!
    private var index = 0
    let profileVC = ProfileViewController()
    var exersiseImage = [UIImage]()

    // MARK: - Properties
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: .zero, height: UIScreen.main.bounds.height + 300)
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.contentMode = .scaleAspectFill
        return contentView
    }()

    lazy var authorPost: UILabel = {
        let  label = UILabel()
        label.text = post.author.fullName
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
       // imageView.image = UIImage(named: post.image)
         imageView.image = UIImage(named: "\(exersiseImage[0])")
        return imageView
    }()

    lazy var postDescription: UILabel = {
        let label = UILabel()
        label.text = post.description
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var likes: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        label.text = "Likes: \(post.likes)"
        return label
    }()

    lazy var views: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Views: \(post.views)"
        return label
    }()
    // MARK: - Method
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        view.backgroundColor = .white
        setConstraints()
        setupNavigationBar()


    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
                configure()
      //  profileVC.delegate = self
        //closure
//        profileVC.closure = { [weak self] indexPath, img in
//            if let url = URL(string: img),
//               let data = try? Data(contentsOf: url),
//               let image = UIImage(data: data) {
//                self?.postImageView.image = image
//            }
//        }
    }


    func sendImagePost(for path: String) {

//        let queue = DispatchQueue.global(qos: .userInitiated)
//        queue.async {
            if let url = URL(string: path),
               let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
//                DispatchQueue.main.async {
                    self.postImageView.image = image
//                }
//            }
        }
    }

//    func configure() {
//        photos.forEach { str in
//
//                let queue = DispatchQueue.global(qos: .userInitiated)
//                queue.async {
//                    if let url = URL(string: str),
//                       let data = try? Data(contentsOf: url),
//                       let image = UIImage(data: data) {
//                        DispatchQueue.main.async {
//                            self.postImageView.image = image
//                    }
//                }
//            }
//        }
//    }
//    func configure() {
//        photos.forEach {
//                sendImagePost(for: $0)
//        }
//    }
    func configure() {
        profileVC.closure = { [weak self] indexPath, img in
            if let url = URL(string: img),
               let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                self?.postImageView.image = image
            }
        }
    }


    func setupNavigationBar() {
        title = "Post"
        let navBar = UINavigationBarAppearance()
        navBar.backgroundColor = .white
        navBar.titleTextAttributes = [.foregroundColor: UIColor(named: "VKColor") ?? UIColor.systemBlue]
        navigationController?.navigationBar.standardAppearance = navBar
        navigationController?.navigationBar.scrollEdgeAppearance = navBar
        navigationController?.navigationBar.tintColor = UIColor(named: "VKColor")
    }

    private func setConstraints(){
        self.scrollView.addSubview(contentView)
        contentView.addSubviews(authorPost, postImageView, postDescription, likes, views)

        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, constant: 100),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            authorPost.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorPost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            postDescription.topAnchor.constraint(equalTo: authorPost.bottomAnchor, constant: 16),
            postDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            postImageView.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            likes.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            likes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),

            views.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            views.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
}

