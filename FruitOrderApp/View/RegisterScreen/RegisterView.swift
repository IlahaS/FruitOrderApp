

import UIKit
import SnapKit


protocol RegisterViewDelegate: AnyObject {
    func registerButtonTapped(email: String?, password: String?)
}

class RegisterView: UIView {
    
    weak var delegate: RegisterViewDelegate?
    var onUserRegistered: ((User) -> Void)?
    var onLogin: ((String?, String?) -> Void)?
    var users = [User]()
    let helper = FileManagerHelper()
    
    lazy var welcome: UILabel! = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 70))
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        label.font = UIFont(name:"Roboto", size: 28)
        label.lineBreakMode = .byWordWrapping
        label.text = "Get started with fresh goodness! Sign up to explore!"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = .grayColor
        return label
    }()
    
    lazy var fullNameTextField: UITextField! = {
        let text1 = UITextField(frame: CGRect(x: 20, y: 100, width: 300, height: 40))
        text1.placeholder = "Enter your fullName"
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
    
    lazy var phoneTextField: UITextField! = {
        let text1 = UITextField(frame: CGRect(x: 20, y: 100, width: 300, height: 40))
        text1.placeholder = "Enter your phone"
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
    
    lazy var registerButton: UIButton! = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Register", for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .purpleColor
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
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
        setupView()
        helper.readData { users in
            self.users = users
        }
        setupErrorLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func showError(message: String) {
        errorLabel.isHidden = false
        errorLabel.text = message
    }
    
    private func validateFields() -> Bool {
        guard let fullName = fullNameTextField.text, !fullName.isEmpty,
              let email = gmailTextField.text, !email.isEmpty,
              let phoneText = phoneTextField.text, !phoneText.isEmpty,
              let _ = Int(phoneText),
              let password = passwordTextField.text, !password.isEmpty else {
            showError(message: "All fields are mandatory")
            return false
        }
        return true
    }
    
    private func setupErrorLabel() {
        addSubview(errorLabel)
        errorLabel.snp.makeConstraints {
            $0.top.equalTo(registerButton.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.lessThanOrEqualToSuperview().offset(-16)
        }
        errorLabel.isHidden = true
    }
    
    func setupView(){
        
        backgroundColor = .white
        addSubview(welcome)
        addSubview(fullNameTextField)
        addSubview(gmailTextField)
        addSubview(phoneTextField)
        addSubview(passwordTextField)
        addSubview(registerButton)
        addSubview(errorLabel)
        
        welcome.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(24)
            $0.leading.trailing.equalToSuperview().inset(32)
            $0.height.equalTo(130)
        }
        
        fullNameTextField.snp.makeConstraints {
            $0.top.equalTo(welcome.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview().inset(32)
            $0.height.equalTo(50)
        }
        
        gmailTextField.snp.makeConstraints {
            $0.top.equalTo(fullNameTextField.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview().inset(32)
            $0.height.equalTo(50)
        }
        
        phoneTextField.snp.makeConstraints {
            $0.top.equalTo(gmailTextField.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview().inset(32)
            $0.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(phoneTextField.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview().inset(32)
            $0.height.equalTo(50)
        }
        
        registerButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(52)
            $0.leading.trailing.equalToSuperview().inset(56)
            $0.height.equalTo(50)
        }
    }
    
    @objc func goToLogin() {
        
        if validateFields() {
            
            delegate?.registerButtonTapped(email: gmailTextField?.text, password: passwordTextField?.text)
            
            let user = User(fullname: fullNameTextField.text ?? "",
                            email: gmailTextField.text ?? "",
                            phone: Int(phoneTextField.text ?? "") ?? 0,
                            password: passwordTextField.text ?? "", basket: [])
            
            onUserRegistered?(user)
            UserManager.shared.currentUser = user
            
            users.append(user)
            helper.writeData(users: self.users)
            
            let defaults = UserDefaults.standard
            defaults.set(fullNameTextField.text, forKey: "fullName")
            defaults.set(gmailTextField.text, forKey: "email")
            defaults.set(phoneTextField.text, forKey: "phone")
        }
    }
}
