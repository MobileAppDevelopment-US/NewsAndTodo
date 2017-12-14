//
//  MainTabBarController.swift
//  NewsAndTodo
//
//  Created by User on 31.07.17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    
    // MARK: Outlets
    
    @IBOutlet weak var todoImageView: UIImageView!
    @IBOutlet weak var newsImageView: UIImageView!
    
    
    // MARK: Properties
    
    static var shared: MainTabBarController?
    
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        MainTabBarController.shared = self
        setStyles()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
    }
    
}


// MARK: Extension

extension MainTabBarController {
    
    func setStyles() {
        
        var color = UIColor.white.withAlphaComponent(0.5)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : color ], for: .normal)
        color = UIColor.white
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : color ], for: .selected)
        guard tabBar.items != nil else {
            
            return
        }
    }
    
}

extension MainTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if let navViewController = viewController as? UINavigationController {
            
            for controller in navViewController.viewControllers {
                
                if controller is NewsTableViewController {
                    let storyboard = UIStoryboard(name: "NewsTableViewController", bundle: nil)
                    let controller = storyboard.instantiateViewController(withIdentifier: "News") as! NewsTableViewController
                    self.navigationController?.pushViewController(controller, animated: true)
                    
                } else if controller is TodoListViewController {
                    let storyboard = UIStoryboard(name: "TodoListViewController", bundle: nil)
                    let controller = storyboard.instantiateViewController(withIdentifier: "TodoList") as! TodoListViewController
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            }
        }
        return true
    }
    
}
