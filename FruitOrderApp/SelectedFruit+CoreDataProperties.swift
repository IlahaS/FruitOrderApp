//
//  SelectedFruit+CoreDataProperties.swift
//  FruitOrderApp
//
//  Created by Ilahe Samedova on 19.11.23.
//
//

import Foundation
import CoreData


extension SelectedFruit {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SelectedFruit> {
        return NSFetchRequest<SelectedFruit>(entityName: "SelectedFruit")
    }

    @NSManaged public var star: Double
    @NSManaged public var price: String?
    @NSManaged public var about: String?
    @NSManaged public var image1: String?
    @NSManaged public var name: String?
    @NSManaged public var image2: String?
    @NSManaged public var image3: String?
    @NSManaged public var isSelected: Bool

}

extension SelectedFruit : Identifiable {

}
