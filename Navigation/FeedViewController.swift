//
//  ViewController.swift
//  Navigation
//
//  Created by Алексей Колыченков on 06.12.2022.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .white
        setupButton()
        buttonAction()
    }
    
    var button: UIButton = {
    let button = UIButton()
    button.backgroundColor = .systemYellow
    button.layer.cornerRadius = 20
    button.setTitle("Открыть", for: .normal)
    button.setTitleColor(.lightGray, for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
return button
    }()

    private func setupButton() {
        self.view.addSubview(self.button)
        self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc private func buttonAction() {
        let postViewController = PostViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
}
