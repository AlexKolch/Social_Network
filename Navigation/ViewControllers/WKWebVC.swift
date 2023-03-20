//
//  PostViewController.swift
//  Navigation
//
//  Created by Алексей Колыченков on 07.12.2022.
//

import UIKit
import WebKit

class WKWebViewController: UIViewController {
    var titlePost: String!
    private let webView = WKWebView()
    private let activityView: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: .large)
        activity.color = .blue
        activity.hidesWhenStopped = true
        activity.translatesAutoresizingMaskIntoConstraints = false
        return activity
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        view.addSubview(activityView)

        setConstraints()
        loadRequest()
    }

//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
//            self.activityView.stopAnimating()
//        }
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
//            self.activityView.startAnimating()
//        }
//
//    }

    private func loadRequest() {
        activityView.startAnimating()
        let queue = DispatchQueue.global(qos: .userInitiated)
        queue.async {
            guard let url = URL(string: "https://disk.yandex.ru/i/n_ypQqzIYIX2tQ") else {return}
            let urlRequest = URLRequest(url: url)
            DispatchQueue.main.async {
                self.webView.load(urlRequest)
                self.activityView.stopAnimating()
            }
        }
    }

    private func setConstraints() {
        self.webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            activityView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}



