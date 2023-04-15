
import UIKit
import FacebookLogin

final class ProfileViewController: UIViewController {
    // MARK: - TableView
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .systemGray5
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    lazy var fbLoginButton: UIButton = {
        let loginButton = FBLoginButton()
        loginButton.frame = CGRect(x: 230,
                                   y: 5,
                                   width: 150,
                                   height: 30)
        loginButton.delegate = self
        return loginButton
    }()

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        checkloginStatus()
        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: ProfileHeaderView.identifier)
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.identifier)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)

        view.addSubview(tableView)
        setConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBar()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
}
    // MARK: - Constraints
extension ProfileViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    func setupNavigationBar() {
        title = "Profile"
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .systemBlue
        navBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.isHidden = false
        navigationController?.tabBarController?.tabBar.isHidden = false
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance

    }
}
    // MARK: - UITableView Delegate
    extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {

        func numberOfSections(in tableView: UITableView) -> Int {
            2
        }


        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            guard section == 0 else { return nil }
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeaderView.identifier)
            headerView?.addSubview(fbLoginButton)

            return headerView
        }


        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            switch section {
            case 0: return 1
            default: return Posts.shared.posts.count
            }
        }


        func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _,_,_ in
                Posts.shared.posts.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            return UISwipeActionsConfiguration(actions: [deleteAction])
        }


        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            switch indexPath.section {
            case 0:
                tableView.deselectRow(at: indexPath, animated: false)
                navigationController?.pushViewController(CollectionViewController(), animated: true)
            default:
                tableView.deselectRow(at: indexPath, animated: true)
                let postsVC = DetailPostVC()

                Posts.shared.posts[indexPath.row].views += 1
                postsVC.post = Posts.shared.posts[indexPath.row]
//передаем картинку из ячейки на след экран
                guard let cell = tableView.cellForRow(at: indexPath) as? ProfileTableViewCell else {return}
                postsVC.postImageView.image = cell.postImageView.image

                navigationController?.pushViewController(postsVC, animated: true)
            }
        }

        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier) as! ProfileTableViewCell
                let urlImg = DataPhoto.shared.urlImages[indexPath.row]

                cell.configureCell(with: indexPath.row, urlString: urlImg)
                return cell
        }
    }
}

extension ProfileViewController: LoginButtonDelegate {

    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {

        if error != nil {
            print(error ?? "")
            return
        }
        print("Success logged")
    }

    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        if !(AccessToken.isCurrentAccessTokenActive) {
            let loginVC = LogInViewController()
            navigationController?.pushViewController(loginVC, animated: false)
        }
    }


    private func checkloginStatus() {
        //проверка на наличие авторизации
        if !(AccessToken.isCurrentAccessTokenActive) {
//            let loginButton = FBLoginButton()
//            loginButton.frame = CGRect(x: 20, y: 580, width: view.frame.width - 40, height: 50)
//            loginButton.delegate = self
//            loginButton.permissions = ["public_profile", "email"]
        let loginVC = LogInViewController()
           // loginVC.view.addSubview(loginButton)
            navigationController?.pushViewController(loginVC, animated: false)
        }
//        if let token = AccessToken.current, !token.isExpired {
//            let token = token.tokenString
//
//            let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields": "email, name"], tokenString: token, version: nil, httpMethod: .get)
//
//            request.start { connection, result, error in
//                print("\(result ?? "")")}
//
//            let profileVC = ProfileViewController()
//            navigationController?.pushViewController(profileVC, animated: false)
//        } else {
//            let loginButton = FBLoginButton()
//            loginButton.frame = CGRect(x: 20, y: 580, width: view.frame.width - 40, height: 50)
//            loginButton.delegate = self
//            loginButton.permissions = ["public_profile", "email"]
//            view.addSubview(loginButton)
        }
}






