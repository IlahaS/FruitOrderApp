

import UIKit
import SnapKit

protocol LoginViewDelegate: AnyObject{
    func loginButtonTapped(email: String?, password: String?)
}

class LoginView: UIView{
    
    var onLogin: ((String?, String?) -> Void)?
    
    weak var delegate: LoginViewDelegate?
    
    lazy var welcome: UILabel! = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 70))
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        label.font = UIFont(name:"Roboto", size: 28)
        label.lineBreakMode = .byWordWrapping
        label.text = "Welcome back! Log in and enjoy the fruity experience!"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = .grayColor
        return label
    }()
    
    lazy var gmailTextField: UITextField! = {
        let text1 = UITextField(frame: CGRect(x: 20, y: 100, width: 300, height: 40))
        text1.placeholder = "Enter your gmail"
        text1.textColor = .black
        text1.translatesAutoresizingMaskIntoConstraints = false
        text1.backgroundColor = .white
        text1.font = UIFont.systemFont(ofSize: 15)
        text1.borderStyle = UITextField.BorderStyle.roundedRect
        text1.autocorrectionType = UITextAutocorrectionType.no
        text1.keyboardType = UIKeyboardType.default
        text1.returnKeyType = UIReturnKeyType.done
        text1.clearButtonMode = UITextField.ViewMode.whileEditing
        return text1
    }()
    
    lazy var passwordTextField: UITextField! = {
        let text1 = UITextField(frame: CGRect(x: 20, y: 100, width: 300, height: 40))
        text1.placeholder = "Enter your password"
        text1.textColor = .black
        text1.isSecureTextEntry = true
        text1.translatesAutoresizingMaskIntoConstraints = false
        text1.backgroundColor = .white
        text1.font = UIFont.systemFont(ofSize: 15)
        text1.borderStyle = UITextField.BorderStyle.roundedRect
        text1.autocorrectionType = UITextAutocorrectionType.no
        text1.keyboardType = UIKeyboardType.default
        text1.returnKeyType = UIReturnKeyType.done
        text1.clearButtonMode = UITextField.ViewMode.whileEditing
        return text1
    }()
    
    lazy var loginButton: UIButton! = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .purpleColor
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(goToHomeScreen), for: .touchUpInside)
        return button
    }()
    
    lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        login()
        onLogin?(gmailTextField.text, passwordTextField.text)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func login() {
        UserDefaults.standard.setValue(true, forKey: "loggedIn")
    }
    
    func showError(message: String) {
        errorLabel.isHidden = false
        errorLabel.text = message
    }
    
    func setupView(){
        
        backgroundColor = .white
        addSubview(welcome)
        addSubview(gmailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(errorLabel)
        
        welcome.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(24)
            $0.leading.trailing.equalToSuperview().inset(32)
            $0.height.equalTo(130)
        }
    
        gmailTextField.snp.makeConstraints {
            $0.top.equalTo(welcome.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview().inset(32)
            $0.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(gmailTextField.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview().inset(32)
            $0.height.equalTo(50)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(52)
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview().inset(56)
        }
        
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.lessThanOrEqualToSuperview().offset(-16)
        }
    }
    
    @objc func goToHomeScreen() {
        delegate?.loginButtonTapped(email: gmailTextField.text, password: passwordTextField.text)
    }
}


