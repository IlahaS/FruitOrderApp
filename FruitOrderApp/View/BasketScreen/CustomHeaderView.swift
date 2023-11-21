import UIKit
import SnapKit

protocol CustomHeaderViewDelegate: AnyObject{
    func didTapBuyButton(with price: Double)
}

final class CustomHeaderView: UICollectionReusableView {

    var price: Double = 0 {
        didSet {
            priceLabel.text = "$\(price)"
        }
    }
    
    static let reuseID = "CustomHeaderView"
    weak var delegate: CustomHeaderViewDelegate?
    
    private let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.image = UIImage(named: "BascetBackground")
        return imageView
    }()
    
    private let headerImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "bascetImage")
        return imageView
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .grayColor
        label.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        return label
    }()
    
    lazy var buyButton: UIButton = {
        let button = UIButton()
        //.setImage(UIImage(named: "plus.square.fill"), for: .normal)
        button.setTitle("Buy", for: .normal)
        button.layer.cornerRadius = 19
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .purpleColor
        button.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(headerImageView)
        addSubview(headerImageView2)
        addSubview(priceLabel)
        addSubview(buyButton)
        
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        headerImageView2.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        
        headerImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(25)
            make.top.equalToSuperview().offset(12)
            make.bottom.equalToSuperview().inset(4)
        }
        
        headerImageView2.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(25)
            make.top.equalToSuperview().offset(12)
            make.bottom.equalToSuperview().inset(4)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(25)
            make.centerX.equalTo(buyButton)
            make.height.equalTo(50)
            make.width.equalTo(150)
        }
        
        buyButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(65)
            make.bottom.equalToSuperview().inset(15)
            make.height.equalTo(50)
            make.width.equalTo(100)
        }
    }
    
    required init?(coder Decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buyButtonTapped() {
        delegate?.didTapBuyButton(with: price)
    }
}

