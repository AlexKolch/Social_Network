
import UIKit

class ProfileViewController: UIViewController {
    let posts = DataPost.arrayPosts()

    // MARK: - TableView
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .systemGray3
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - View Life Cycle
    override func viewDidLoad() {

        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(ProfileTableHederView.self, forHeaderFooterViewReuseIdentifier: ProfileTableHederView.identifier)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)

        view.addSubview(tableView)
        setConstraints()
    }
}
// MARK: - Extension Constraints
extension ProfileViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
    // MARK: - UITableViewDataSource, UITableViewDelegate
    extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {

        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileTableHederView.identifier)
        }

//        func numberOfSections(in tableView: UITableView) -> Int {
//            return 1
//        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           posts.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier) as! PostTableViewCell
            cell.authorPost.text = posts[indexPath.item].author
            cell.postImageView.image = UIImage(named: posts[indexPath.item].image)
            cell.postDescription.text = posts[indexPath.item].description
            cell.likes.text = "Likes: \(posts[indexPath.item].likes)"
            cell.view.text = "View: \(posts[indexPath.item].views)"
//            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileTableHederView.identifier) as! ProfileTableHederView
//            header.statusLabel.text = posts[indexPath.item].description
//            header.avatarImageView.image = UIImage(named: posts[indexPath.item].image)
//            header.fullNameLabel.text = posts[indexPath.item].author

            return cell
        }
    }


