//
//  PostViewController.swift
//  Navigation
//
//  Created by Алексей Колыченков on 07.12.2022.
//

import UIKit

class PostViewController: UIViewController {
    var titlePost: String = ""
    var info = Info(title: "Информация")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(buttonItem))
    }
    
    @objc private func buttonItem() {
        let infoViewController = InfoViewController()
        infoViewController.titleInfo = info.title
        self.present(infoViewController, animated: true)
        self.navigationController?.pushViewController(infoViewController, animated: true)
        
    }
    
    func setupView() {
        view.backgroundColor = .white
        navigationItem.title = titlePost
    }
}



