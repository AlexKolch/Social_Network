
import UIKit

class ProfileViewController: UIViewController {
    let posts = DataPost.arrayPosts()

    // MARK: - TableView
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - View Life Cycle
    override func viewDidLoad() {

        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(ProfileTableHederView.self, forHeaderFooterViewReuseIdentifier: ProfileTableHederView.identifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "default")

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
    // MARK: - UITableViewDataSource
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
            let cell = UITableViewCell(style: .value1, reuseIdentifier: "default")
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileTableHederView.identifier) as! ProfileTableHederView
//            header.statusLabel.text = posts[indexPath.item].author
//            header.avatarImageView.image = UIImage(named: posts[indexPath.item].author)
//            header.fullNameLabel.text = posts[indexPath.item].author

//            var content = cell.defaultContentConfiguration()
//            content.text
            return cell
        }
    }


