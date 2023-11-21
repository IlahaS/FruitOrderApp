

import UIKit
import SnapKit

protocol FirstViewDelegate: AnyObject {
    func loginButtonTapped()
    func registerButtonTapped()
}

class FirstView: UIView {
    
    weak var delegate: FirstViewDelegate?
    
    let firstImage: UIImageView = {
        var image = UIImageView()
        image.image = .logoImage
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var loginButton: UIButton! = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .purpleColor
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton: UIButton! = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Register", for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .grayColor
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(gotoRegister), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        
        backgroundColor = .white
        addSubview(firstImage)
        addSubview(loginButton)
        addSubview(registerButton)
        
        firstImage.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(56)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(250)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(firstImage.snp.bottom).offset(32)
            $0.height.equalTo(50)
            $0.leading.equalToSuperview().offset(32)
            $0.trailing.equalToSuperview().offset(-32)
        }
        
        registerButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(16)
            $0.height.equalTo(50)
            $0.leading.equalToSuperview().offset(32)
            $0.trailing.equalToSuperview().offset(-32)
        }
    }
    
    @objc func goToLogin() {
        delegate?.loginButtonTapped()
    }
    
    @objc func gotoRegister() {
        delegate?.registerButtonTapped()
    }
}
