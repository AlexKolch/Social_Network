
import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {

    static let identifier = "profileHeaderID"
    let user = DataUser.setupUser()

    // MARK: - Properties
    private var avatarStartPoint = CGPoint()

    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 132, height: 132))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(named: user.image)
        return imageView
    }()

    private lazy var avatarBackground: UIView = {
        let view = UIView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: UIScreen.main.bounds.width,
                height: UIScreen.main.bounds.height
            )
        )
        view.backgroundColor = .darkGray
        view.alpha = 0
        return view
    }()

    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.alpha = 0
        button.backgroundColor = .clear
        button.tintColor = .black
        button.contentMode = .scaleToFill
        button.setImage(UIImage(systemName: "xmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20)), for: .normal)
        button.addTarget(self, action: #selector(backButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var fullNameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = user.fullName
        nameLabel.font = UIFont.boldSystemFont(ofSize: 21)
        nameLabel.textColor = .black
        return nameLabel
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = user.status
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
    // MARK: - init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.layer.shadowOffset = CGSize(width: 4, height: 4)
        contentView.addSubviews(
            fullNameLabel,
            statusLabel,
            statusTextField,
            setStatusButton,
            avatarBackground,
            avatarImageView,
            backButton
        )
        setConstraints()
        imageGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func changeStatusButtonTapped() {
        if !(statusTextField.text!.isEmpty) {
            statusLabel.text = statusTextField.text
            statusTextField.text = .none
            statusTextField.resignFirstResponder()
        } else {
            showAlert(withTitle: "Упс...", andMessage: "Кажется вы не ввели значение")
            statusTextField.shake()
        }
    }

    private func showAlert(withTitle title: String, andMessage message: String) {
        guard let rootVC = window?.rootViewController else {return}
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        rootVC.present(alert, animated: true)
    }
    // MARK: - GestureSettings
    private func imageGesture(){
        let tapGestureImage = UITapGestureRecognizer(target: self, action: #selector(avatarDidTapped))
        tapGestureImage.numberOfTapsRequired = 1
        tapGestureImage.numberOfTouchesRequired = 1
        avatarImageView.addGestureRecognizer(tapGestureImage)
    }

    @objc private func avatarDidTapped(){
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut) {
            self.avatarStartPoint = self.avatarImageView.center
            self.avatarBackground.alpha = 0.9
            self.avatarImageView.layer.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width) //трансформация
            self.avatarImageView.center = CGPoint(x: self.avatarBackground.center.x, y: self.avatarBackground.center.y - 55) //перемещение
            self.avatarImageView.layer.cornerRadius = 0
            self.avatarImageView.layer.borderWidth = 0
            self.layoutIfNeeded()
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.backButton.alpha = 1
            }
        }
    }

    @objc private func backButtonDidTapped() {
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: .curveEaseInOut) {
            self.backButton.alpha = 0
        } completion: { _ in
            self.avatarBackground.alpha = 0.0
            self.avatarImageView.layer.borderWidth = 3
            //self.avatarImageView.layer.position = self.avatarStartPoint
            self.avatarImageView.center = self.avatarStartPoint
            self.avatarImageView.layer.bounds = CGRect(x: 0, y: 0, width: 120, height: 120)
            self.avatarImageView.layer.cornerRadius = self.avatarImageView.bounds.width / 2
            self.layoutIfNeeded()
        }
        //второй вариант
//        UIImageView.animate(withDuration: 0.2) {
//            self.backButton.alpha = 0
//            self.avatarBackground.alpha = 0
//            self.avatarImageView.center = self.avatarStartPoint
//            self.avatarImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
//            self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.width / 2
//        }
    }
}
extension ProfileHeaderView {
    // MARK: - Constraints
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
            setStatusButton.heightAnchor.constraint(equalToConstant: 45),

            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            backButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
}


//второй вариант

/*@objc private func avatarDidTapped(sender: UITapGestureRecognizer){
    let imageView = sender.view
    avatarStartPoint = avatarImageView.frame.origin

    switch sender.state {

    case .began, .changed:
        self.avatarImageView.isUserInteractionEnabled = true
        UIView.animate(withDuration: 0.5) {
            self.avatarImageView.center = CGPoint(x: UIScreen.main.bounds.midX,
                                                  y: UIScreen.main.bounds.midY)  //на центр экрана
            self.avatarImageView.transform = CGAffineTransform(
                scaleX: 4, y: 4
            )
            self.avatarImageView.layer.cornerRadius = 0
            self.avatarBackground.isHidden = false
            self.avatarBackground.alpha = 0.9
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.backButton.alpha = 1
            }
        }
    case .cancelled, .ended:
        break
    case .failed, .possible:
        break
    @unknown default:
        fatalError()
    }
}
*/
