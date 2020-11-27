//
//  TabBarViewController.swift
//  AlineaTask
//
//  Created by Appernaut on 20/11/20.
//

import UIKit

class TabBarViewController: UITabBarController {
    lazy public var homeViewController: UINavigationController = {
        let homeVC = PagerTabViewController()
        let homeNVC = getNavigationController(root: homeVC)
        homeNVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "ic_home")!, selectedImage: nil)
        return homeNVC
    }()

    lazy public var searchViewController: UINavigationController = {
        let searchVC = EmptyViewController()
        searchVC.view.backgroundColor = ATColor.alineaRed
        let searchNVC = getNavigationController(root: searchVC)
        searchNVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "ic_search")!, selectedImage: nil)
        return searchNVC
    }()

    lazy public var marketViewController: UINavigationController = {
        let marketVC = EmptyViewController()
        marketVC.view.backgroundColor = ATColor.alineaBottleGreen
        let marketNVC = getNavigationController(root: marketVC)
        marketNVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "ic_stock_account")!, selectedImage: nil)
        return marketNVC
    }()

    lazy public var profileViewController: UINavigationController = {
        let profileVC = EmptyViewController()
        profileVC.view.backgroundColor = ATColor.alineaBlue
        let profileNVC = getNavigationController(root: profileVC)
        profileNVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "ic_user_account")!, selectedImage: nil)
        return profileNVC
    }()

    lazy public var ideasViewController: UINavigationController = {
        let ideasVC = EmptyViewController()
        ideasVC.view.backgroundColor = ATColor.alineaYellow
        let ideasNVC = getNavigationController(root: ideasVC)
        ideasNVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "ic_bulb")!, selectedImage: nil)
        return ideasNVC
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
}

// MARK: - Helpers
extension TabBarViewController {
    private func setupTabBar() {
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -2)
        tabBar.layer.shadowRadius = 10
        tabBar.layer.shadowOpacity = 0.2
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.masksToBounds = false
        
        viewControllers = [homeViewController, searchViewController, marketViewController, profileViewController, ideasViewController]
        tabBar.tintColor = ATColor.alineaBlue
    }
    
    private func getNavigationController(root: UIViewController) -> UINavigationController{
        let navigationController = UINavigationController(rootViewController: root)
        navigationController.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.layoutIfNeeded()
        if #available(iOS 13.0, *) {
            navigationController.overrideUserInterfaceStyle = .light
        }
        return navigationController
    }
}
