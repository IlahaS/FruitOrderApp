

import UIKit

class RegisterViewController: UIViewController {
    
    var registerView: RegisterView = RegisterView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerView.delegate = self
        setupView()
        
    }
    private func setupView(){
        view.addSubview(registerView)
        registerView.translatesAutoresizingMaskIntoConstraints = false
        registerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
extension RegisterViewController: RegisterViewDelegate {
    func registerButtonTapped(email: String?, password: String?) {
        let loginViewController = LoginViewController()
        loginViewController.loginView.gmailTextField.text = email
        loginViewController.loginView.passwordTextField.text = password
        navigationController?.pushViewController(loginViewController, animated: true)
    }
}
