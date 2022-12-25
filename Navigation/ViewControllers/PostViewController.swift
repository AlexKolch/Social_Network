//
//  PostViewController.swift
//  Navigation
//
//  Created by Алексей Колыченков on 07.12.2022.
//

import UIKit

class PostViewController: UIViewController {
    var titlePost: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goInfo))
    }
    
    @objc private func goInfo() {
        let infoViewController = InfoViewController()
        navigationController?.present(infoViewController, animated: true)
    }
    
    func setupView() {
        view.backgroundColor = .white
        navigationItem.title = titlePost
    }
}



