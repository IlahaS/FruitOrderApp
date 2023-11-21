

import UIKit
import CoreData

final class BasketViewController: UIViewController {
    var selectedFruits = [SelectedFruit]()
    private let coredata: CoreDataModel
    var totalPrice: Double = 0.0
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    init(coredata: CoreDataModel) { //dependency injection
        self.coredata = coredata
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        print("selectedFruit: \(selectedFruits)")
        view.addSubview(collectionView)
        
        navigationItem.title = Titles.basketTitle.rawValue
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 26, weight: .bold)
        ]
        layout.scrollDirection = .vertical
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        layout.headerReferenceSize = CGSize(width: 350, height: 150)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(BasketCell.self, forCellWithReuseIdentifier: BasketCell.identifier)
        collectionView.register(CustomHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CustomHeaderView.reuseID)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchAndUpdateCollectionView()
    }
    
    func fetchAndUpdateCollectionView() {
        coredata.fetchItems { [weak self] fruits in
            self?.selectedFruits = fruits
            self?.collectionView.reloadData()
        }
    }
}

extension BasketViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedFruits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BasketCell", for: indexPath) as! BasketCell
        cell.delegate = self
        let fruit = selectedFruits[indexPath.row]
        cell.configure(with: fruit)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 210)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 20, left: 37, bottom: 0, right: 37)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CustomHeaderView.reuseID, for: indexPath) as! CustomHeaderView
            headerView.delegate = self
            totalPrice = selectedFruits.reduce(0.0) { (result, fruit) in
                if let price = Double(fruit.price ?? "0") {
                    return result + price
                }
                return result
            }
            headerView.price = totalPrice
            return headerView
        } else {
            return UICollectionReusableView()
        }
    }
}

extension BasketViewController: BasketCellDelegate {
    func didTapDeleteButton(with fruit: SelectedFruit) {
        if let index = selectedFruits.firstIndex(where: { $0 == fruit }) {
            let deletedFruit = selectedFruits.remove(at: index)
            coredata.deleteItems(fruit: deletedFruit)
            collectionView.reloadData()
        }
    }
}

extension BasketViewController: CustomHeaderViewDelegate {
    func didTapBuyButton(with price: Double) {
        let purchaseVC = PurchaseController()
        purchaseVC.price = totalPrice
        navigationController?.pushViewController(purchaseVC, animated: true)
    }
}

