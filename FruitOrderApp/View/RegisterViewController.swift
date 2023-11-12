

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
        
        NSLayoutConstraint.activate([
            registerView.topAnchor.constraint(equalTo: view.topAnchor),
            registerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            registerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            registerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
extension RegisterViewController: RegisterViewDelegate {
    func registerButtonTapped() {
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
}
