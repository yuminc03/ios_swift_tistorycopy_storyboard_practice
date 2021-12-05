//
//  ViewController.swift
//  TistoryStoryboard
//
//  Created by LS-NOTE-00106 on 2021/12/03.
//

import UIKit

class TabBarViewController: UITabBarController {

    var lastTabBarIndex: Int? = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.tintColor = .black
        tabBar.unselectedItemTintColor = .white
        tabBar.backgroundColor = .gray
        tabBar.backgroundImage = nil
        tabBar.isTranslucent = false
    }
    
    func createTabBarItem(viewController: UIViewController, _ tag: Int) -> UINavigationController {
        let navCont = UINavigationController(rootViewController: viewController)
        navCont.view.tag = tag
        navCont.navigationBar.isHidden = true
        return navCont
    }
    
    override var selectedViewController: UIViewController? {
        willSet{
            lastTabBarIndex = selectedViewController?.view.tag
        }
    }
}

