import UIKit

final class ResultController: UIViewController {
    
    private let successLabel: UILabel = {
        let label = UILabel()
        label.text = "Payment Successful!"
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var exitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Exit", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(successLabel)
        view.addSubview(exitButton)
        
        NSLayoutConstraint.activate([
            successLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            successLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            exitButton.topAnchor.constraint(equalTo: successLabel.bottomAnchor, constant: 36),
            exitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            exitButton.heightAnchor.constraint(equalToConstant: 50),
            exitButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc func exitButtonTapped(){
        let vc = TabViewController()
        
        let coreData = CoreDataModel(context: AppDelegate().persistentContainer.viewContext)
        coreData.deleteAllItems()
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.window?.rootViewController =  UINavigationController(rootViewController: vc)
        }
    }
}
