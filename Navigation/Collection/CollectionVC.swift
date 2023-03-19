//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Алексей Колыченков on 16.01.2023.
//

import UIKit

class CollectionViewController: UIViewController {
    private let images = DataPhoto.shared.urlImages
    //private let photos = DataPhoto.shared.photos
    // MARK: - Properties
    private var photosCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
       // layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 32)/3, height: 100)
        layout.scrollDirection = .vertical

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        collectionView.register(PhotoCollectionView.self, forCellWithReuseIdentifier: PhotoCollectionView.identifier)
        return collectionView
    }()

    private let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.alpha = 0.0
        return view
    }()

    private let fullImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.alpha = 0.0
        return imageView
    }()
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(photosCollectionView)
        self.view.addSubview(backgroundView)
        self.view.addSubview(fullImageView)

        photosCollectionView.dataSource = self
        photosCollectionView.delegate = self

        setConstraints()
        setupNavigationBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }
}
    // MARK: - Constraints
extension CollectionViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            photosCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            photosCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photosCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photosCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            fullImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            fullImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            fullImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fullImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            backgroundView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            backgroundView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    // MARK: - NavigationBar
    private func setupNavigationBar() {
        title = "Photo Gallery"
        navigationController?.navigationBar.tintColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeImage))
        navigationItem.rightBarButtonItem?.isHidden = true
        navigationController?.tabBarController?.tabBar.isHidden = true
    }

    @objc func closeImage(){
        navigationItem.rightBarButtonItem?.isHidden = true
        UIView.animate(withDuration: 0.5) {
            self.fullImageView.alpha = 0.0
            self.backgroundView.alpha = 0.0
        }
    }
}
    // MARK: - Delegate
extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       // photos.count
        images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionView.identifier, for: indexPath) as! PhotoCollectionView
//        let photoCell = UIImage(named: photos[indexPath.item])
//        cell.photoImage.image = photoCell

        cell.configure(path: images[indexPath.row])
        return cell
    }
}
    // MARK: - DelegateFlowLayout
extension CollectionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let imageSize = (photosCollectionView.frame.width - 4 * 8) / 3
        return CGSize(width: imageSize, height: imageSize)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        fullImageView.image = UIImage(named: images[indexPath.row])
       // fullImageView.image = UIImage(named: photos[indexPath.row])
        navigationItem.rightBarButtonItem?.isHidden = false
        UIView.animate(withDuration: 0.7) {
            self.fullImageView.alpha = 1
            self.backgroundView.alpha = 0.5
        }
    }
}
