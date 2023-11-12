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
    var fruits: [Fruit]
}

struct Fruit: Codable{
    var name: String?
    var price: String?
    var about: String?
    var star: Int?
}

