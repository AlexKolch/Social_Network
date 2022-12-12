//
//  Alert.swift
//  Navigation
//
//  Created by Алексей Колыченков on 12.12.2022.
//

import Foundation
import UIKit

class UIAlertController: UIViewController {
    let message = "Сообщение"
    let mainTitle = "Alert"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        self.title = mainTitle
        
        let button = UIButton()
        view.addSubview(button)
        button.setTitle("Alert1", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction(UIAction(handler: { _ in
            print(self.message)
        }), for: .touchUpInside)
        NSLayoutConstraint.activate([button.centerYAnchor.constraint(equalTo: view.centerYAnchor), button.leadingAnchor.constraint(equalTo: view.leadingAnchor), button.trailingAnchor.constraint(equalTo: view.trailingAnchor), button.heightAnchor.constraint(equalToConstant: 30)])
        
        let button1 = UIButton()
        view.addSubview(button1)
        button.setTitle("Alert2", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction(UIAction(handler: { _ in
            print(self.message)
        }), for: .touchUpInside)
        NSLayoutConstraint.activate([button1.centerYAnchor.constraint(equalTo: view.centerYAnchor), button1.leadingAnchor.constraint(equalTo: view.leadingAnchor), button1.trailingAnchor.constraint(equalTo: view.trailingAnchor), button1.heightAnchor.constraint(equalToConstant: 30)])
    }
}
