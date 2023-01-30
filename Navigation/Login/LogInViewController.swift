
import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
  let user = DataUser.setupUser
// MARK: - UIScrollView
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.addSubview(contentView)
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentSize = CGSize(width: .zero, height: UIScreen.main.bounds.height)
        scrollView.keyboardDismissMode = .interactive
        return scrollView
    }()
    
    let contentView: LogInView = {
        let contentView = LogInView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.logInButton.addTarget(
            self,
            action: #selector(buttonDidTapped),
            for: .touchUpInside)
        return contentView
    }()
// MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.loginTextField.delegate = self
        contentView.passwordTextField.delegate = self

        self.view.addSubview(scrollView)

        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        addKeyboardNotifications()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.isHidden = false
        removeKeyboardNotifications()
    }
// MARK: - KeyboardNotifications
    func addKeyboardNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        let userInfo = notification.userInfo
        let keyboardFrameSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
       // scrollView.contentSize = CGSize(width: .zero, height: keyboardFrameSize.height + 20)
        scrollView.contentOffset = CGPoint(x: 0, y: keyboardFrameSize.height - self.view.safeAreaInsets.bottom - 200)
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        scrollView.contentOffset = .zero
    }
    
    @objc func buttonDidTapped() {
        let profileViewController = ProfileViewController()
        guard let loginValue = contentView.loginTextField.text else {return}
        guard let password = contentView.passwordTextField.text else {return}

        if user().password == password && (user().email == loginValue || user().phone == loginValue) &&
            isValidEmail(loginValue) {
//            contentView.loginTextField.text = "siliconCat@mail.ru"
//            contentView.loginTextField.text = "89997654321"
//            contentView.passwordTextField.text = "password"
            navigationController?.pushViewController(profileViewController, animated: true)
        } else if loginValue.count == 0 {
            contentView.loginTextField.shakeTF()
            alertIsEmpty(loginValue: nil, password: password)
        } else if password.count == 0 {
            alertIsEmpty(loginValue: loginValue, password: nil)
            contentView.passwordTextField.shakeTF()
        } else {
            shakeTextField(contentView.loginTextField)
            shakeTextField(contentView.passwordTextField)
            showAlert(withTitle: "Некорректный Login или Password", andMessage: "Email: ****at@mail.ru \n Password: ******")
        }
    }

    func alertIsEmpty(loginValue: String?, password: String?) {
        if loginValue == nil {
            let alertEmail = UIAlertController(title: "Email/Phone не должен быть пустым!", message: "Пожалуйста, введите значение", preferredStyle: .alert)
            let okEmail = UIAlertAction(title: "Ok", style: .default)
            alertEmail.addAction(okEmail)
            present(alertEmail, animated: true)
        }
        if password == nil {
            let alertPassword = UIAlertController(title: "Password не должен быть пустым!", message: "Пожалуйста, введите значение", preferredStyle: .alert)
            let okPassword = UIAlertAction(title: "Ok", style: .default)
            alertPassword.addAction(okPassword)
            present(alertPassword, animated: true)
        }
    }

    private func showAlert(withTitle title: String, andMessage message: String){
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "Ok", style: .default)

        alert.addAction(okAction)
        present(alert, animated: true)
    }

    private func shakeTextField(_ textField: UITextField){
        textField.shakeTF()
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func setKeyboardSettings(UITextField textField: UITextField){
        textField.delegate = self
        textField.keyboardAppearance = .default
        textField.autocorrectionType = .no
        textField.returnKeyType = .done
        textField.clearButtonMode = .always
        let tapOnView = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapOnView)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}
// MARK: - extension Constraints
extension LogInViewController {
    func setConstraints(){
       
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
    }
}
// MARK: - extension
extension LogInViewController {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 1 {
            textField.shakeTF()
        } else {
            textField.shakeTF()
        }
        return false
    }
}
