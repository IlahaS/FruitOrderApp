
import Foundation
import UIKit
import SnapKit

protocol FruitCellDelegate: AnyObject {
    func didTapAddButton(with fruit: Fruit)
}

final class FruitCell: UICollectionViewCell {
    
    static let identifier = "FruitCollectionViewCell"
    weak var delegate: FruitCellDelegate?
    var selectedFruits: Fruit = Fruit()
    var containerView = UIView()
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var imageViewBack1: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var imageViewBack2: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    var detailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .detailColor
        label.font = UIFont.systemFont(ofSize:10)
        return label
    }()
    
    var buttonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "rectangle")
        return imageView
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        //.setImage(UIImage(named: "plus.square.fill"), for: .normal)
        button.setImage(.plus, for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(containerView)
        containerView.addSubview(imageViewBack2)
        containerView.addSubview(imageViewBack1)
        containerView.addSubview(imageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(priceLabel)
        containerView.addSubview(detailLabel)
        containerView.addSubview(buttonImage)
        containerView.addSubview(addButton)
        containerView.layer.cornerRadius = 15
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.grayColor2.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(0)
            make.top.equalToSuperview().inset(0)
            make.bottom.equalToSuperview().inset(0)
        }
        
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(32)
            make.width.height.equalTo(72)
            make.leading.equalTo(imageViewBack2.snp.leading).inset(0)
        }
        
        imageViewBack1.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(12)
            make.width.height.equalTo(91)
        }
        
        imageViewBack2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(24)
            make.width.height.equalTo(68)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(12)
            make.top.equalTo(imageViewBack2.snp.bottom).offset(32)
        }
        
        detailLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(12)
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(16)
            make.leading.equalToSuperview().inset(12)
            make.height.equalTo(32)
        }
        
        buttonImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(12)
            make.height.equalTo(35)
            make.bottom.equalToSuperview().inset(12)
        }
        
        addButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(22)
            make.height.equalTo(35)
            make.bottom.equalToSuperview().inset(12)
        }
        
    }
    
    func configure(with fruit: Fruit) {
        imageView.image = UIImage(named: fruit.image1 ?? "")
        imageViewBack1.image = UIImage(named: fruit.image2 ?? "")
        imageViewBack2.image = UIImage(named: fruit.image3 ?? "")
        nameLabel.text = fruit.name
        priceLabel.text = "$\(fruit.price ?? "")"
        detailLabel.text = "by weight $\(fruit.price ?? "") kq"
        selectedFruits = fruit
    }
    
    @objc func addButtonTapped() {
        print("Add button tapped")
        delegate?.didTapAddButton(with: selectedFruits)
    }
}
