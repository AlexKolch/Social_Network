
import UIKit

class ProfileViewController: UIViewController {
    let posts = Post.arrayPosts()

    // MARK: - TableView
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.frame, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
   // let identifire = "MyCell"
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "default")
        tableView.dataSource = self
        tableView.delegate = self
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

        func numberOfSections(in tableView: UITableView) -> Int {
            return 4
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            //posts.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell(style: .value1, reuseIdentifier: "default")
            var content = cell.defaultContentConfiguration()
            content.text
            
        }
        // MARK: - UITableViewDelegate


    }


