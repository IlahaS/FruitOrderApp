import Foundation
import SnapKit
import UIKit

final class PurchaseController: UIViewController {
    
    var purchaseView: PurchaseView = PurchaseView()
    
    var price: Double = 0.0 {
        didSet {
            purchaseView.updatePriceLabel(with: price)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        purchaseView.delegate = self
    }
    private func setupView() {
        view.addSubview(purchaseView)
        purchaseView.translatesAutoresizingMaskIntoConstraints = false
        purchaseView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
extension PurchaseController: PurchaseViewDelegate {
    func payButtonTapped() {
        let resultVC = ResultController()
        navigationController?.pushViewController(resultVC, animated: true)
    }
}
