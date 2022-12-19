//
//  Profile.swift
//  Navigation
//
//  Created by Алексей Колыченков on 06.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profileHeader = ProfileHeaderView()
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
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
}
