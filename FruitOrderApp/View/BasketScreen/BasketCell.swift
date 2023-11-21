
import Foundation
import UIKit
import SnapKit

protocol BasketCellDelegate: AnyObject {
    func didTapDeleteButton(with fruit: SelectedFruit)
}

final class BasketCell: UICollectionViewCell {
    
    static let identifier = "BasketCell"
    weak var delegate: BasketCellDelegate?
    var deletedFruit: SelectedFruit = SelectedFruit()
    var containerView = UIView()
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var imageViewBack1: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var imageViewBack2: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    private var detailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .detailColor
        label.font = UIFont.systemFont(ofSize:10)
        return label
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private var buttonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "rectangle2")
        return imageView
    }()
    
    lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(.trash1, for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
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
        containerView.addSubview(deleteButton)
        
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
        
        priceLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(16)
            make.leading.equalToSuperview().inset(12)
            make.height.equalTo(32)
        }
        
        detailLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(12)
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
        }
        
        buttonImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(12)
            make.height.equalTo(35)
            make.bottom.equalToSuperview().inset(12)
        }
        
        deleteButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(22)
            make.height.equalTo(35)
            make.bottom.equalToSuperview().inset(12)
        }
    }
    
    func configure(with fruit: SelectedFruit) {
        
        imageView.image = UIImage(named: fruit.image1 ?? "")
        imageViewBack1.image = UIImage(named: fruit.image2 ?? "")
        imageViewBack2.image = UIImage(named: fruit.image3 ?? "")
        nameLabel.text = fruit.name
        priceLabel.text = "$\(fruit.price ?? "")"
        detailLabel.text = "by weight $\(fruit.price ?? "") kq"
        deletedFruit = fruit
    }
    
    @objc func deleteButtonTapped() {
        print("Delete button tapped")
        delegate?.didTapDeleteButton(with: deletedFruit)
    }
}
