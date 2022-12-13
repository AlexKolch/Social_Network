//
//  Profile.swift
//  Navigation
//
//  Created by Алексей Колыченков on 06.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .lightGray
//        title = "Profile"
        setupView()
       
    }
    
    private func setupView() {
        self.view = getRootView()
        self.view.addSubview(self.profileHeaderView)
       // profileHeaderView.superview = 
    }
    
    override func viewWillLayoutSubviews() {
        profileHeaderView.frame = self.view.frame
    }
    
    private func getRootView() -> UIView {
        let view = UIView()
        view.backgroundColor = .lightGray
        title = "Profile"
        return view
    }
}
