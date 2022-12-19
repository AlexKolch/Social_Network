//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Алексей Колыченков on 10.12.2022.
//

import Foundation
import UIKit

final class ProfileHeaderView: UIView {
    
    // MARK: - Properties
    private var statusText: String = "Cowabunga!"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(profileTextField)
        addSubview(profileSpiderLabel)
        addSubview(profileButton)
        addSubview(profileImageView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let profileSpiderLabel: UILabel = {
        let spiderLabel = UILabel()
        spiderLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 21)
        spiderLabel.center = CGPoint(x: 230, y: 130)
        spiderLabel.textAlignment = .center
        spiderLabel.text = "Spider-man"
        spiderLabel.font = UIFont.boldSystemFont(ofSize: 21)
        return spiderLabel
    }()
    
    let profileTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 139, y: 180, width: 200, height: 31)
        textField.textAlignment = .center
        textField.placeholder = "Waiting for something"
        textField.font = UIFont.boldSystemFont(ofSize: 14)
        return textField
    }()
    
    lazy var profileButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 250, width: 350, height: 50)
        button.translatesAutoresizingMaskIntoConstraints = true
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 19
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    let profileImageView: UIImageView = {
        let profileImage = UIImageView(frame: CGRect(x: 20, y: 105, width: 130, height: 130))
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.contentMode = .scaleAspectFit
        profileImage.clipsToBounds = true
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.layer.borderWidth = 3
        profileImage.translatesAutoresizingMaskIntoConstraints = true
        profileImage.image = UIImage(named: "spider")
        return profileImage
    }()
    // MARK: - UiView Life Cycle
    @objc private func buttonPressed() {
        print(statusText)
    }
}

