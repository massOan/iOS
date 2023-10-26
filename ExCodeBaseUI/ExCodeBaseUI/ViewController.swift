//
//  ViewController.swift
//  ExCodeBaseUI
//
//  Created by 장익준 on 2023/10/21.
//

import UIKit

class ViewController: UITabBarController, UITabBarControllerDelegate {


    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
         
     }
     
     override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         
         // Create Tab one
         let tabOne = SecondViewController()
         let tabOneBarItem = UITabBarItem(title: "Tab 1", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
         
         tabOne.tabBarItem = tabOneBarItem
         
         
         // Create Tab two
         let tabTwo = SettingViewController()
         let tabTwoBarItem2 = UITabBarItem(title: "Tab 2", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))
         
         tabTwo.tabBarItem = tabTwoBarItem2
         
         
         self.viewControllers = [tabOne, tabTwo]
     }
     
     // UITabBarControllerDelegate method
//     func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
////         print("Selected \(viewController.title!)")
//     }
 }
        

    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        // Create Tab one
//        let tabOne = ViewController()
//        let tabOneBarItem = UITabBarItem(title: "Tab 1", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
//
//        tabOne.tabBarItem = tabOneBarItem
//
//
//        // Create Tab two
//        let tabTwo = SecondViewController()
//        let tabTwoBarItem2 = UITabBarItem(title: "Tab 2", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))
//
//        tabTwo.tabBarItem = tabTwoBarItem2
//
//
//        self.viewControllers = [tabOne, tabTwo]
//    }
//
//        //Delegate methods
//        func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//            print("Should select viewController: \(viewController.title ?? "") ?")
//            return true;
//        }



    


