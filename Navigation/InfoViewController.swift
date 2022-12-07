//
//  InfoViewController.swift
//  Navigation
//
//  Created by Алексей Колыченков on 07.12.2022.
//

import UIKit

class InfoViewController: UIViewController {
    var titleInfo: String = ""
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
//        buttonGo()
//        showAlert()

        view.addSubview(button)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        button.center = view.center
        button.backgroundColor = .systemYellow
        button.setTitle("Открыть", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.addTarget(self, action: #selector(buttonGo), for: .touchUpInside)
    }
    
    @objc func buttonGo() {
        showAlert()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        navigationItem.title = titleInfo
    }
}

extension InfoViewController {
    func showAlert() {
        let alertController = UIAlertController(title: "title", message: "message", preferredStyle: .alert)

        let oneAction = UIAlertAction(title: "Ok", style: .default) { _ in
            print("Ok")
        }
        alertController.addAction(oneAction)

        let twoAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel")
        }
        alertController.addAction(twoAction)


        present(alertController, animated: true) {
            print("alert controller is presented")
        }
    }
}
    /////////////////// ВТОРОЙ СПОСОБ
//    func showAlert() {
//        let alert = UIAlertController(title: "Sign out?", message: "You can always access your content by signing back in",         preferredStyle: UIAlertController.Style.alert)
//
//        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
//                //Cancel Action
//            }))
//            alert.addAction(UIAlertAction(title: "Sign out",
//                                          style: UIAlertAction.Style.default,
//                                          handler: {(_: UIAlertAction!) in
//                                            //Sign out action
//            }))
//            self.present(alert, animated: true, completion: nil)
//        }
    /////////////////////
  

