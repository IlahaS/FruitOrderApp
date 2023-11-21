

import UIKit
import SnapKit

class FirstViewController: UIViewController {
    
    var firstView: FirstView = FirstView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        firstView.delegate = self
    }
    
    private func setupView(){
        view.addSubview(firstView)
        firstView.translatesAutoresizingMaskIntoConstraints = false
        firstView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
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
