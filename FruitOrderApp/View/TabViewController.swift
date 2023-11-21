//
//  TabViewController.swift
//  FruitOrderApp
//
//  Created by Ilahe Samedova on 15.11.23.
//

import UIKit

final class TabViewController: UITabBarController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabs()
        customizeTabBarAppearance()
    }
    private func setUpTabs(){
        let home = self.createNav(with: "Home", and: UIImage(systemName: "house") ?? .banana, and: HomeViewController())
        let coreDataInstance = CoreDataModel(context: context)
        let basket = self.createNav(with: "Basket", and: UIImage(systemName: "basket") ?? .banana, and: BasketViewController(coredata: coreDataInstance))
        let profile = self.createNav(with: "Profile", and: UIImage(systemName: "person") ?? .banana, and: ProfileViewController())
        self.setViewControllers([home,basket,profile], animated: true)
    }
    
    private func createNav(with name: String, and image: UIImage, and vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = name
        nav.tabBarItem.image = image
        return nav
    }
    private func customizeTabBarAppearance() {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.greenColor], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.greenColor], for: .selected)
        self.tabBar.tintColor = .greenColor
    }
}
