
import Foundation
import UIKit
import CoreData

class CoreDataModel{
    
    var selectedFruit: SelectedFruit? {
        // computed property
        createSelectedFruitEntity()
    }
    
    var contex = AppDelegate().persistentContainer.viewContext
    var fruit = [SelectedFruit]()
    let persistentContainer: NSPersistentContainer
    
    init(container: NSPersistentContainer) {
        self.persistentContainer = container
        self.contex = container.viewContext
    }
    
    init(context: NSManagedObjectContext) {
        self.contex = context
        self.persistentContainer = NSPersistentContainer(name: "YourDataModelName")
        persistentContainer.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
    }
    
    func saveItems(fruit: Fruit){
        let item = SelectedFruit(context: contex)
        item.name = fruit.name
        item.price = fruit.price
        item.about = fruit.about
        item.star = fruit.star ?? 0
        item.image1 = fruit.image1
        item.image2 = fruit.image2
        item.image3 = fruit.image3
        
        do{
            try contex.save()
        } catch{
            print(error.localizedDescription)
        }
    }
    
    func fetchItems(completion: @escaping ([SelectedFruit]) -> Void) {
        do{
            let fruit = try contex.fetch(SelectedFruit.fetchRequest())
            self.fruit = fruit
            completion(fruit)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func deleteItems(fruit: SelectedFruit){
        do{
            contex.delete(fruit)
            try contex.save()
            
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func createSelectedFruitEntity() -> SelectedFruit? {
        guard let entity = NSEntityDescription.entity(forEntityName: "SelectedFruit", in: contex) else {
            print("Failed to create entity description for SelectedFruit")
            return nil
        }
        return  SelectedFruit(entity: entity, insertInto: contex)
    }
    
    func deleteAllItems() {
            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "SelectedFruit")
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            
            do {
                try contex.execute(deleteRequest)
                try contex.save()
            } catch let error as NSError {
                print("Error deleting all items: \(error)")
            }
        }
    
}
