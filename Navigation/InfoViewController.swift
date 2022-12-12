//
//  InfoViewController.swift
//  Navigation
//
//  Created by Алексей Колыченков on 07.12.2022.
//

import UIKit

class InfoViewController: UIViewController {
    var titleInfo: String = "Информация"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = titleInfo
       // setupView()

        let button = UIButton()
        self.view.addSubview(button)
        button.frame = CGRect(x: 200, y: 200, width: 100, height: 50)
        button.setTitle("Открыть", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.center = view.center
        //button.backgroundColor = .systemRed
        //button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
       //button.addTarget(self, action: #selector(buttonGo), for: .touchUpInside)
        button.addAction(UIAction(handler: { _ in
            let vc = UIAlertController()
            self.present(vc, animated: true)
        }), for: .touchUpInside)
        NSLayoutConstraint.activate([button.centerYAnchor.constraint(equalTo: view.centerYAnchor), button.leadingAnchor.constraint(equalTo: view.leadingAnchor), button.trailingAnchor.constraint(equalTo: view.trailingAnchor), button.heightAnchor.constraint(equalToConstant: 30)])
    }
}

    
//    @objc func buttonGo() {
//        showAlert()
//    }
    
//    private func setupView() {
//        view.backgroundColor = .white
//        navigationItem.title = titleInfo
//    }


//extension InfoViewController {
//    func showAlert() {
//        let alertController = UIAlertController(title: "title", message: "message", preferredStyle: .alert)
//
//        present(alertController, animated: true) {
//            print("alert controller is presented")
//
//        let oneAction = UIAlertAction(title: "Ok", style: .default) { _ in
//            print("Ok")
//        }
//        alertController.addAction(oneAction)
//
//        let twoAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
//            print("Cancel")
//        }
//        alertController.addAction(twoAction)
//
//        }
//    }

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
  

