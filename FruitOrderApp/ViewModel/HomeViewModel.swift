
import Foundation
import UIKit

class HomeViewModel {
    
    var parser = Parser()
    var items = [Fruit]()
    
    func fetchDataAndUpdateCollectionView() {
        parser.parseJsonFile { items in
            self.items = items
        }
    }
}

