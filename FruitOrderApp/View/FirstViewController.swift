

import UIKit

class FirstViewController: UIViewController {

    var firstView: FirstView = FirstView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        firstView.delegate = self
        //view.backgroundColor = .red
    }
    
    private func setupView(){
        view.addSubview(firstView)
        firstView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstView.topAnchor.constraint(equalTo: view.topAnchor),
            firstView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            firstView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            firstView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let viewControllers = navigationController?.viewControllers, viewControllers.contains(self) {
            navigationController?.popToViewController(self, animated: false)
        }
    }
    
}

extension FirstViewController: FirstViewDelegate {
    
    func loginButtonTapped() {
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    func registerButtonTapped() {
        let registerViewController = RegisterViewController()
        navigationController?.pushViewController(registerViewController, animated: true)
    }
    
}
