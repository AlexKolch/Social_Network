
import UIKit

class ProfileViewController: UIViewController {
    
    var profileHeader = ProfileHeaderView()
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeader.frame = self.view.frame
    }
    // MARK: - Setup Settings
    private func setupView() {
        self.view = getRootView()
        self.view.addSubview(profileHeader)
    }
    
    private func getRootView() -> UIView {
        let view = UIView()
        view.backgroundColor = .lightGray
        title = "Profile"
        return view
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
