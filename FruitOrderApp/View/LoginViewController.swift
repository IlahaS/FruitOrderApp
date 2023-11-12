

import UIKit

class LoginViewController: UIViewController {

    var loginView: LoginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.delegate = self
        setupView()
    }
    
    private func setupView(){
        view.addSubview(loginView)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.topAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}
extension LoginViewController: LoginViewDelegate{
    func loginButtonTapped() {
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
