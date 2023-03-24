//
//  PostViewController.swift
//  Navigation
//
//  Created by Алексей Колыченков on 07.12.2022.
//

import UIKit
import WebKit

final class WKWebViewController: UIViewController {

    private let webView = WKWebView()

    private let activityView: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: .large)
        activity.color = .systemBlue
        activity.hidesWhenStopped = true
        activity.translatesAutoresizingMaskIntoConstraints = false
        return activity
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        view.addSubview(activityView)
        
        navigationItem.title = "Сертификаты"
        setConstraints()
        loadPDF()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            self.activityView.startAnimating()
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.7) {
            self.activityView.stopAnimating()
        }
    }

    private func loadPDF() {
        let queue = DispatchQueue.global(qos: .userInitiated)
        queue.async {
            guard let urlPdf = Bundle.main.url(forResource: "Certificates", withExtension: "pdf") else {return}
            let urlRequest = URLRequest(url: urlPdf)
            DispatchQueue.main.async {
                self.webView.load(urlRequest)
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



