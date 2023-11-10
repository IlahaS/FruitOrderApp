

import UIKit

protocol LoginViewDelegate: AnyObject{
    func loginViewDismiss()
}

class LoginView: UIView{
    
    weak var delegate: LoginViewDelegate?
    
    lazy var welcome: UILabel! = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 70))
            label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 1
        label.font = UIFont(name: label.font.fontName, size: 50)
        label.font = UIFont(name:"Roboto", size: 28)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
            label.text = "Welcome back! Log in to your account and enjoy the fruity experience."

        return label
    }()
}
