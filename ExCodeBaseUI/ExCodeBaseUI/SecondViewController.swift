//
//  SecondViewController.swift
//  ExCodeBaseUI
//
//  Created by 장익준 on 2023/10/24.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.backgroundColor = UIColor.systemMint
//        self.title = "item1"
//        print("item 1 loaded")
        
        let nextButton = UIButton()
        
        nextButton.backgroundColor = .systemMint
        nextButton.setTitle("Next Button", for: .normal)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(nextButton)
        
        
        NSLayoutConstraint.activate([
            
            nextButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            nextButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            nextButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
            
        ])
        
//        nextButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    

    
//
//    @objc private func didTapButton() {
//
////        let firstVC = SecondViewController()
//
//        let naviC = UINavigationController(rootViewController:
//                                            SecondViewController())
//
//        let vc = DetailViewController()
////        vc.view.backgroundColor = .systemMint
//        self.view.window?.rootViewController = naviC
//
//        naviC.pushViewController(vc, animated: true)
//
////        self.view.window?.rootViewController = SecondViewController()
////      self.present(vc, animated: true, completion: nil)
//
//    }
}
