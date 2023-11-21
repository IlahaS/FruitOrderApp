
import UIKit
import SnapKit

final class HomeViewController: UIViewController {
    
    var coreData = CoreDataModel(context: AppDelegate().persistentContainer.viewContext)
    var fruits: HomeViewModel = HomeViewModel()
    var basketViewController: BasketViewController?
    var addToBasketAction: ((SelectedFruit) -> Void)?
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    var items: [Fruit] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = Titles.homeTitle.rawValue
        view.addSubview(collectionView)
        fruits.fetchDataAndUpdateCollectionView()
        print("Number of items fetched: \(fruits.items.count)")
        layout.scrollDirection = .vertical
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottom)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
        }
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(FruitCell.self, forCellWithReuseIdentifier: FruitCell.identifier)
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout , UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fruits.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FruitCollectionViewCell", for: indexPath) as! FruitCell
        cell.delegate = self
        let fruit = fruits.items[indexPath.item]
        cell.configure(with: fruit)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 210)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 20, left: 37, bottom: 0, right: 37)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let fruit = fruits.items[indexPath.row]
        let viewModel = ItemViewModel(fruit: fruit)
        let vc = ItemViewController(viewModel: viewModel)
        self.navigationController?.show(vc, sender: nil)
    }
    
}
extension HomeViewController: FruitCellDelegate {
    func didTapAddButton(with fruit: Fruit) {
        let alertController = UIAlertController(title: "Do you want to add this item to the basket?", message: "", preferredStyle: .alert)
        let addButton = UIAlertAction(title: "Add", style: .default) { [self] _ in
            coreData.saveItems(fruit: fruit)
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(addButton)
        alertController.addAction(cancelButton)
        present(alertController, animated: true)
    }
}

