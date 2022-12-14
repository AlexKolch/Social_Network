//
//  InfoViewController.swift
//  Navigation
//
//  Created by Алексей Колыченков on 07.12.2022.
//

import UIKit

class InfoViewController: UIViewController {
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeButton()
    }
    // MARK: - Setup Button

    private func makeButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        button.center = view.center
        button.setTitle("Открыть", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.addTarget(self, action: #selector(buttonGo), for: .touchUpInside)
        button.backgroundColor = .systemRed
        view.addSubview(button)
    }
    // MARK: - Alert
    @objc func buttonGo() {
        let alert = UIAlertController(title: "Открыть", message: "Пожалуйста, нажмите кнопку", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .cancel) { _ in
            self.dismiss(animated: true)
            print("Ok")
            }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in
            self.dismiss(animated: true)
                print("Cancel")
            }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}
