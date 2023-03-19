//
//  PostViewController.swift
//  Navigation
//
//  Created by Алексей Колыченков on 07.12.2022.
//

import UIKit
import WebKit

class PostViewController: UIViewController {
    var titlePost: String!
    let webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        setupView()

        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        setConstraints()
        loadRequest()
        //        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goInfo))
    }
    
    //    @objc private func goInfo() {
    //        let infoViewController = InfoViewController()
    //        navigationController?.present(infoViewController, animated: true)
    //    }
    //
    //    func setupView() {
    //        view.backgroundColor = .white
    //        navigationItem.title = titlePost
    //    }
    private func loadRequest() {
        guard let url = URL(string: "https://disk.yandex.ru/i/n_ypQqzIYIX2tQ") else {return}
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}



