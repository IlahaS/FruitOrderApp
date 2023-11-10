

import UIKit
import SnapKit

class FirstView: UIView {
    
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
        
        backgroundColor = .yellowColor
        addSubview(firstImage)
        addSubview(loginButton)
        addSubview(registerButton)
        
        loginButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(32)
            $0.bottom.
        }
        
//        NSLayoutConstraint.activate([
//        
//            firstImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 56 ),
//            firstImage.leadingAnchor.constraint(equalTo: leadingAnchor),
//            firstImage.trailingAnchor.constraint(equalTo: trailingAnchor),
//            firstImage.heightAnchor.constraint(equalToConstant: 250),
//            
//            loginButton.topAnchor.constraint(equalTo: firstImage.bottomAnchor, constant: 32),
//            loginButton.heightAnchor.constraint(equalToConstant: 50),
//            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
//            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
//            
//            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 16),
//            registerButton.heightAnchor.constraint(equalToConstant: 50),
//            registerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
//            registerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
//            
//        ])
    }
    
}
