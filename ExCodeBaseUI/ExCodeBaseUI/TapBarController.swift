//
//  ViewController.swift
//  ExCodeBaseUI
//
//  Created by 장익준 on 2023/10/21.
//

import UIKit

class TapBarController: UITabBarController, UITabBarControllerDelegate {

    let nextButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        nextButton.backgroundColor = .systemMint
        nextButton.setTitle("Next Button", for: .normal)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(nextButton)
        
        }

    override func viewWillAppear(_ animated: Bool) {
        setupTapBar()
        setupButton()
    }
    
    
    public func setupButton () {
//        let  tabFrame = self.tabBarController?.tabBar.frame.height; //self.TabBar is IBOutlet of your TabBar

//            let constraint = nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: height)
        
        NSLayoutConstraint.activate([
            nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: self.view.frame.height - 150)
        ])
        nextButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)

    }
    
    private func setupTapBar(){
        
        // Create Tab one
        let tabOne = HomeController()
        let tabOneBarItem = UITabBarItem(title: "Tab 1", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
        
        tabOne.tabBarItem = tabOneBarItem
        
        // Create Tab two
        let tabTwo = SettingViewController()
        let tabTwoBarItem2 = UITabBarItem(title: "Tab 2", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))
        
        tabTwo.tabBarItem = tabTwoBarItem2
        
        self.viewControllers = [tabOne, tabTwo]
    }
    
    
    @objc private func didTapButton() {

        let naviC = UINavigationController(rootViewController:
                                            TapBarController())
        let vc = DetailViewController()
//        vc.view.backgroundColor = .systemMint
        self.view.window?.rootViewController = naviC

        naviC.pushViewController(vc, animated: true)
        
//        self.view.window?.rootViewController = SecondViewController()
//      self.present(vc, animated: true, completion: nil)
        
    }
 }


    


