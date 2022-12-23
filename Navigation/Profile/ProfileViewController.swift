
import UIKit

class ProfileViewController: UIViewController {
    // MARK: - Private Properties
    //var profileHeader = ProfileHeaderView()
    lazy var profileHeader: ProfileHeaderView = {
        let profileHeader = ProfileHeaderView()
        profileHeader.translatesAutoresizingMaskIntoConstraints = false
        return profileHeader
    }()
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(profileHeader)
        setConstraints()
        view.backgroundColor = .lightGray
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            profileHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileHeader.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
}
    

