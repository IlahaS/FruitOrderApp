//
//  DataModel.swift
//  FruitOrderApp
//
//  Created by Ilahe Samedova on 12.11.23.
//

import Foundation

class UserManager{
    
    static let shared = UserManager()
    var currentUser: User?
    private init() { }
}

struct User: Codable{
    
    var fullname: String?
    var email: String?
    var phone: Int?
    var password: String?
    var basket: [Fruit]
}

struct Fruit: Codable{
    var name: String?
    var price: String?
    var about: String?
    var star: Double?
    var image1: String?
    var image2: String?
    var image3: String?
    var isSelected: Bool?
}

enum Titles: String {
    case homeTitle = "Fruits & Vegetables"
    case basketTitle = "Everything in your door step"
    case profileTitle = "Your personal data: "
}


