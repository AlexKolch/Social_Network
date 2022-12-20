//
//  LoginView.swift
//  Navigation
//
//  Created by Алексей Колыченков on 20.12.2022.
//

import UIKit

final class LogInView: UIView {
    // MARK: - Properties
    let logoImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "ImageVK")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let loginTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.masksToBounds = true
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.autocapitalizationType = .none
        textField.placeholder = "Email or phone"
        textField.backgroundColor = .systemGray6
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.lightGray.cgColor
        
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.masksToBounds = true
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.autocapitalizationType = .none
        textField.placeholder = "Password"
        textField.backgroundColor = .systemGray6
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    let logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(named: "MyColor")
        button.setImage(UIImage(named: "blue_pixel"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
       return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(logoImageView)
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(logInButton)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Constraints
extension LogInView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 120),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            loginTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            loginTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            loginTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),

            
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
