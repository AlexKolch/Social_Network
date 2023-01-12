
import Foundation
import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    static let identifier = "profileHeaderID"
    // MARK: - Properties

    let avatarImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 132, height: 132))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.image = UIImage(named: "cat")
        return imageView
    }()
    
    let fullNameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Hipster Cat"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 21)
        nameLabel.textColor = .black
        return nameLabel
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Status"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    let statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textField.placeholder = "Set your status..."
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 12
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Setup status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 19
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(changeStatusButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(fullNameLabel)
        contentView.addSubview(statusLabel)
        contentView.addSubview(statusTextField)
        contentView.addSubview(setStatusButton)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func changeStatusButtonTapped() {
        statusLabel.text = statusTextField.text
    }
}
    
// MARK: - Setup Settings
extension ProfileHeaderView {

    private func setConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 45),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 132),
            avatarImageView.heightAnchor.constraint(equalToConstant: 132),
            
            fullNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 49),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 26),
            fullNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -26),
            
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 27),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 26),
            statusLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -26),
            
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -20),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 20),
            setStatusButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            setStatusButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}






