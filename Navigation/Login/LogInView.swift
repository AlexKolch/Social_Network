//
//  LoginView.swift
//  Navigation
//
//  Created by Алексей Колыченков on 20.12.2022.
//

import UIKit
//import FBSDKLoginKit

final class LogInView: UIView {
    // MARK: - Properties
    let logoImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "ImageVK")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    var loginStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = .systemGray6
        stackView.clipsToBounds = true
        return stackView
    }()
    
    lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.masksToBounds = true
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.autocapitalizationType = .none
        textField.placeholder = "Email or phone"
        textField.backgroundColor = .systemGray6
        textField.layer.borderWidth = 0.5
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.returnKeyType = .done
        textField.enablesReturnKeyAutomatically = true
        textField.clearButtonMode = .always
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.tag = 1
        textField.addTarget(self, action: #selector(tfWasChanget), for: .editingChanged)
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.masksToBounds = true
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.autocapitalizationType = .none
        textField.placeholder = "Password"
        textField.backgroundColor = .systemGray6
        textField.layer.borderWidth = 0.5
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        textField.enablesReturnKeyAutomatically = true
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.isSecureTextEntry = true
        textField.tag = 2
        textField.addTarget(self, action: #selector(tfWasChanget), for: .editingChanged)
        return textField
    }()

    let hiddenLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Количество символов меньше 4"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .red
        label.isHidden = true
        return label
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

//    lazy var fbLoginButton: UIButton = {
//        let loginButton = FBLoginButton()
//        loginButton.translatesAutoresizingMaskIntoConstraints = false
//        return loginButton
//    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews(logoImageView, loginStackView, logInButton, hiddenLabel)
        loginStackView.addArrangedSubview(loginTextField)
        loginStackView.addArrangedSubview(passwordTextField)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func tfWasChanget(_ textField: UITextField){
        let textCount = textField.text?.count
        if let tc = textCount {
            if tc < 4 {
                hiddenLabel.isHidden = false
            } else {
                hiddenLabel.isHidden = true
            }
        }
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

            hiddenLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8),
            hiddenLabel.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),

            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 34),
            logInButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),

//            fbLoginButton.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 26),
//            fbLoginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
//            fbLoginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}
    // MARK: - ShakeTextField
extension UITextField {
    func shakeTF(){
        let shakeAnimation = CABasicAnimation(keyPath: "position")
        shakeAnimation.duration = 0.05
        shakeAnimation.repeatCount = 6
        shakeAnimation.autoreverses = true
        shakeAnimation.fromValue = CGPoint(x: self.center.x - 4, y: self.center.y)
        shakeAnimation.toValue = CGPoint(x: self.center.x + 4, y: self.center.y)
        layer.add(shakeAnimation, forKey: "position")
    }

    func shake(for duration: TimeInterval = 0.5,
               withTranslation translation: CGFloat = 10) {
        let propertyAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 0.3) {
            self.transform = CGAffineTransform(translationX: translation, y: 0)
        }

        propertyAnimator.addAnimations({
            self.transform = CGAffineTransform(translationX: 0, y: 0)
        }, delayFactor: 0.2)

        propertyAnimator.startAnimation()
    }
}
