import UIKit
import SnapKit

protocol PurchaseViewDelegate: AnyObject {
    func payButtonTapped()
}

final class PurchaseView: UIView {
    
    weak var delegate: PurchaseViewDelegate?
    
    private let cardNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Card Number"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let expirationDateTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Expiration Date"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let cvvTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "CVV"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    lazy var payButton: UIButton = {
        let button = UIButton()
        button.setTitle("Pay Now", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(payButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(cardNumberTextField)
        addSubview(expirationDateTextField)
        addSubview(cvvTextField)
        addSubview(priceLabel)
        addSubview(payButton)
        
        cardNumberTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide).offset(50)
            make.width.equalToSuperview().inset(20)
        }
        
        expirationDateTextField.snp.makeConstraints { make in
            make.centerX.width.equalTo(cardNumberTextField)
            make.top.equalTo(cardNumberTextField.snp.bottom).offset(20)
        }
        
        cvvTextField.snp.makeConstraints { make in
            make.centerX.width.equalTo(cardNumberTextField)
            make.top.equalTo(expirationDateTextField.snp.bottom).offset(20)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(cvvTextField.snp.bottom).offset(40)
        }
        
        payButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(priceLabel.snp.bottom).offset(30)
            make.width.equalTo(120)
            make.height.equalTo(40)
        }
    }
    func updatePriceLabel(with price: Double) {
        priceLabel.text = String(format: "$%.2f", price)
    }
    
    @objc private func payButtonTapped() {
        delegate?.payButtonTapped()
    }
}
