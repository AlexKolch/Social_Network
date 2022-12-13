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

        view.addSubview(button)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        button.center = view.center
        button.backgroundColor = .systemRed
        button.setTitle("Открыть", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.addTarget(self, action: #selector(buttonGo), for: .touchUpInside)
    }
    
    @objc func buttonGo(_ sender: UIButton) {
        let alertController = UIAlertController(title: "title", message: "message", preferredStyle: .alert)
        
            alertController.addAction(UIAlertAction(title: "Ok", style: .default) { _ in
                print("Ok")
            })
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in
                print("Cancel")
            })
        self.present(alertController, animated: true)
    }
    
    private func setupView() {
        view.backgroundColor = .white
        navigationItem.title = titleInfo
    }
}

//extension InfoViewController {
//    func showAlert() {
        
                                      
        //alertController.titlePost = info.title
        //self.navigationController?.pushViewController(alertController, animated: true)

//        let oneAction = UIAlertAction(title: "Ok", style: .default) { _ in
//            print("Ok")
//        }
      //  alertController.addAction(oneAction)

//        let twoAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
//            print("Cancel")
//        }
//        alertController.addAction(twoAction)
//
//        }
       
            //print("alert controller is presented")

    
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
  

