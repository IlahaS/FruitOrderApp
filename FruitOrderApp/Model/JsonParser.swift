import Foundation


class Parser {
    func parseJsonFile(completion: @escaping ([Fruit]) -> Void) {
        if let file = Bundle.main.url(forResource: "Fruit", withExtension: "json") {
            do {
                let data = try Data(contentsOf: file)
                let items = try JSONDecoder().decode([Fruit].self, from: data)
                completion(items)
            } catch {
                print("Error parsing JSON:", error.localizedDescription)
                completion([])
            }
        } else {
            print("Fruit.json file not found.")
            completion([])
        }
    }
}

