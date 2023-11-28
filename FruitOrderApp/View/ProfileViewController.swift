import UIKit
import SnapKit
//import Lottie

final class ProfileViewController: UIViewController {
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var signOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Out", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(signOutTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//    private let animationView: LottieAnimationView = {
//            let animationView = LottieAnimationView()
//            animationView.contentMode = .scaleAspectFit
//            animationView.loopMode = .loop 
//            animationView.translatesAutoresizingMaskIntoConstraints = false
//            return animationView
//        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupLabels()
        loadUserInfoFromUserDefaults()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = Titles.profileTitle.rawValue
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 28, weight: .bold)
        ]
        
//        if let animation = Lottie.Animation.named("Animation") {
//            animationView.animation = animation
//            animationView.play()
//        }
    }
    
    private func setupLabels() {
        view.addSubview(fullNameLabel)
        view.addSubview(phoneNumberLabel)
        view.addSubview(emailLabel)
        view.addSubview(signOutButton)
        //view.addSubview(animationView)
        
//        animationView.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(emailLabel.snp.bottom).offset(40) // Adjust as needed
//            make.width.equalTo(200) // Adjust width
//            make.height.equalTo(200) // Adjust height
//        }
        
        fullNameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.leading.equalToSuperview().offset(20)
        }
        
        phoneNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(fullNameLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        signOutButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(200)
        }
    }
    
    private func loadUserInfoFromUserDefaults() {
        if let fullName = UserDefaults.standard.string(forKey: "fullName"),
           let phoneNumber = UserDefaults.standard.string(forKey: "phone"),
           let email = UserDefaults.standard.string(forKey: "email") {
            fullNameLabel.text = "Full Name: \(fullName)"
            phoneNumberLabel.text = "Phone Number: \(phoneNumber)"
            emailLabel.text = "Email: \(email)"
        }
    }
    @objc func signOutTapped() {
        
        UserDefaults.standard.removeObject(forKey: "fullName")
        UserDefaults.standard.removeObject(forKey: "phone")
        UserDefaults.standard.removeObject(forKey: "email")
        
        let coreData = CoreDataModel(context: AppDelegate().persistentContainer.viewContext)
        coreData.deleteAllItems()
        
        let firstVC = FirstViewController()
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.window?.rootViewController =  UINavigationController(rootViewController: firstVC)
        }
        
    }
}
