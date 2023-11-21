

import UIKit

class LoginViewController: UIViewController {
    
    var loginView: LoginView = LoginView()
    let fileManager = FileManagerHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.delegate = self
        setupView()
    }
    
    private func setupView(){
        view.addSubview(loginView)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        loginView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}

extension LoginViewController: LoginViewDelegate {
    func loginButtonTapped(email: String?, password: String?) {
        if let enteredEmail = email, let enteredPassword = password {
            if enteredEmail.isEmpty || enteredPassword.isEmpty {
                showError(message: "Enter something!")
            } else if !isValidEmail(email: enteredEmail) {
                showError(message: "Invalid email format!")
            } else if enteredPassword.count < 5 || enteredPassword.count > 10 {
                showError(message: "Wrong password format!")
            } else {
                fileManager.readData { users in
                    if users.contains(where: { $0.email == enteredEmail && $0.password == enteredPassword }) {
                        let vc = TabViewController()
                        navigationController?.pushViewController(vc, animated: true)
                    } else {
                        showError(message: "Incorrect email or password!")
                    }
                }
            }
        }
    }
    
    private func showError(message: String) {
        loginView.showError(message: message)
    }
}

