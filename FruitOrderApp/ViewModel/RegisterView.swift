

import UIKit
import SnapKit

protocol RegisterViewDelegate: AnyObject{
    func registerViewDismiss()
}

class RegisterView: UIView {
    
    weak var delegate: RegisterViewDelegate?
    
    lazy var welcome: UILabel! = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 70))
            label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 1
        label.font = UIFont(name: label.font.fontName, size: 50)
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 28)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
            label.text = "Get started with fresh goodness! Sign up to explore a world of delicious fruits."

        return label
    }()
    
    lazy var textF1: UITextField! = {
        let text1 = UITextField(frame: CGRect(x: 20, y: 100, width: 300, height: 40))
        text1.placeholder = "Enter your fullName"
        text1.textColor = .white
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
    
    lazy var textF2: UITextField! = {
        let text1 = UITextField(frame: CGRect(x: 20, y: 100, width: 300, height: 40))
        text1.placeholder = "Enter your gmail"
        text1.textColor = .white
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
    
    lazy var textF3: UITextField! = {
        let text1 = UITextField(frame: CGRect(x: 20, y: 100, width: 300, height: 40))
        text1.placeholder = "Enter your phone"
        text1.textColor = .white
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
    
    lazy var textF4: UITextField! = {
        let text1 = UITextField(frame: CGRect(x: 20, y: 100, width: 300, height: 40))
        text1.placeholder = "Enter your password"
        text1.textColor = .white
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func setupView(){
        addSubview(welcome)
        addSubview(textF1)
        addSubview(textF2)
        addSubview(textF3)
        addSubview(textF4)
        addSubview(registerButton)
        
        welcome.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(24)
            $0.leading.trailing.equalToSuperview().offset(32)
            $0.height.equalTo(100)
        }
        
        textF1.snp.makeConstraints {
            $0.top.equalTo(welcome.snp.bottom).offset(32)
            $0.leading.equalToSuperview().offset(32)
            
        }
    }
    
    @objc
    func goToLogin() {
        
    }
}
