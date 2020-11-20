//
//  TabBarViewController.swift
//  AlineaTask
//
//  Created by Appernaut on 20/11/20.
//

import UIKit
import AZTabBar

class TabBarViewController: UIViewController {
    var tabController: AZTabBarController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
}

// MARK: - Helpers
extension TabBarViewController {
    private func setupTabBar() {
        var icons = [UIImage]()
        icons.append(UIImage(named: "ic_home")!)
        icons.append(UIImage(named: "ic_search")!)
        icons.append(UIImage(named: "ic_stock_account")!)
        icons.append(UIImage(named: "ic_user_account")!)
        icons.append(UIImage(named: "ic_bulb")!)
        
        //init
        tabController = .insert(into: self, withTabIcons: icons)
        
        //set delegate
        tabController.delegate = self
        
        //set child controllers
        let homeVC = PagerTabViewController()
        tabController.setViewController(getNavigationController(root: homeVC), atIndex: 0)
        
        let searchVC = EmptyViewController()
        searchVC.view.backgroundColor = ATColor.alineaBottleGreen
        tabController.setViewController(getNavigationController(root: searchVC), atIndex: 1)
        
        let marketVC = EmptyViewController()
        marketVC.view.backgroundColor = ATColor.alineaRed
        tabController.setViewController(getNavigationController(root: marketVC), atIndex: 2)
        
        let connectionVC = EmptyViewController()
        connectionVC.view.backgroundColor = ATColor.alineaYellow
        tabController.setViewController(getNavigationController(root: connectionVC), atIndex: 3)
        
        let accountVC = EmptyViewController()
        accountVC.view.backgroundColor = ATColor.alineaBlue
        tabController.setViewController(getNavigationController(root: accountVC), atIndex: 4)
        
        //customize
        tabController.highlightedBackgroundColor = ATColor.alineaBlue ?? .blue
        tabController.defaultColor = .darkGray
        tabController.selectedColor = .white
        tabController.buttonsBackgroundColor = UIColor(red: (247.0/255), green: (247.0/255), blue: (247.0/255), alpha: 1.0)
        tabController.selectionIndicatorHeight = 0
        tabController.tabBarHeight = 50
        tabController.animateTabChange = false
        tabController.onlyShowTextForSelectedButtons = false
        tabController.separatorLineVisible = false
        
        let container = tabController.buttonsContainer!

        container.layer.shadowOffset = CGSize(width: 0, height: -2)
        container.layer.shadowRadius = 10
        container.layer.shadowOpacity = 0.2
        container.layer.shadowColor = UIColor.black.cgColor

        tabController.highlightButton(atIndex: 0)
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

// MARK: - AZTabBar Delegate
extension TabBarViewController: AZTabBarDelegate {
    func tabBar(_ tabBar: AZTabBarController, statusBarStyleForIndex index: Int) -> UIStatusBarStyle {
        return .default
    }
    
    func tabBar(_ tabBar: AZTabBarController, shouldAnimateButtonInteractionAtIndex index: Int) -> Bool {
        return false
    }
    
    func tabBar(_ tabBar: AZTabBarController, didSelectTabAtIndex index: Int) {
        for (i, _) in tabController.buttons.enumerated() {
            if i == index {
                tabController.highlightButton(atIndex: i)
            } else {
                tabController.removeHighlight(atIndex: i)
            }
        }
        
    }
}
