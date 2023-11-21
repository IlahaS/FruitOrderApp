
import SnapKit
import UIKit

final class ItemViewController: UIViewController {
    private let viewModel: ItemViewModel?
    private var stepper : UIStepper = UIStepper()
    private var stepperCount: Int = 0
    var coreData = CoreDataModel(context: AppDelegate().persistentContainer.viewContext)
    
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
    
    var starImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Star")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var starContainerView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.grayColor2.cgColor
        view.layer.cornerRadius = 18
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let starLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    lazy var addToCartButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .greenColor
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(addToCartTapped), for: .touchUpInside)
        return button
    }()
    
    init(viewModel: ItemViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
        setupViews()
        configure()
        updatePriceLabel()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @objc private func stepperValueChanged() {
        stepperCount = Int(stepper.value)
        updatePriceLabel()
    }
    
    private func updatePriceLabel() {
        if let viewModel = viewModel {
            let basePrice = Double(viewModel.fruit.price ?? "0") ?? 0.0
            let quantity = stepper.value
            let totalPrice = basePrice * quantity
            priceLabel.text = String(format: "$%.2f", totalPrice)
        }
    }
    func setupViews(){
        
        view.backgroundColor = .white
        
        view.addSubview(imageViewBack2)
        view.addSubview(imageViewBack1)
        view.addSubview(imageView)
        
        let stackview1: UIStackView = {
            let view = UIStackView()
            view.addArrangedSubview(titleLabel)
            view.addArrangedSubview(starContainerView)
            view.axis = .horizontal
            view.distribution = .fillProportionally
            view.alignment = .fill
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        let stackView : UIStackView = {
            let view = UIStackView()
            view.axis = .vertical
            view.spacing = 25
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        let stackview2: UIStackView = {
            let view = UIStackView()
            view.addArrangedSubview(priceLabel)
            view.addArrangedSubview(stepper)
            view.addArrangedSubview(addToCartButton)
            view.axis = .horizontal
            view.spacing = 20
            view.distribution = .fillEqually
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(stackview1)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(stackview2)
        starContainerView.addSubview(starImage)
        starContainerView.addSubview(starLabel)
        
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(140)
            make.width.height.equalTo(250)
            
        }
        imageViewBack1.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.width.height.equalTo(260)
            
        }
        imageViewBack2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(140)
            make.width.height.equalTo(180)
            
        }
        starContainerView.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(80)
        }
        
        starImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(21)
        }
        
        starLabel.snp.makeConstraints { make in
            make.leading.equalTo(starImage.snp.trailing).offset(8)
            make.centerY.equalTo(starImage.snp.centerY)
            make.trailing.equalToSuperview()
            make.height.equalTo(21)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(imageViewBack1.snp.bottom).offset(40)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
        }
    }
    
    private func configure() {
        if let viewModel = viewModel {
            titleLabel.text = viewModel.fruit.name
            priceLabel.text = "$\(viewModel.fruit.price ?? "")"
            imageView.image = UIImage(named: viewModel.fruit.image1 ?? "")
            imageViewBack1.image = UIImage(named: viewModel.fruit.image2 ?? "")
            imageViewBack2.image = UIImage(named: viewModel.fruit.image3 ?? "")
            descriptionLabel.text = viewModel.fruit.about
            starLabel.text = "\(viewModel.fruit.star ?? 0)"
        }
    }
    
    @objc private func addToCartTapped() {
        let alertController = UIAlertController(title: "Do you want to add this item to the basket?", message: "", preferredStyle: .alert)
        
        let addButton = UIAlertAction(title: "Add", style: .default) { [self] _ in
            guard let selectedFruit = viewModel?.fruit else { return }
            
            let quantity = Int(stepper.value)
            for _ in 0..<quantity {
                coreData.saveItems(fruit: selectedFruit)
            }
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(addButton)
        alertController.addAction(cancelButton)
        present(alertController, animated: true)
    }
}

