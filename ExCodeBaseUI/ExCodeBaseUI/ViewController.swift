//
//  ViewController.swift
//  ExCodeBaseUI
//
//  Created by 장익준 on 2023/10/21.
//

import UIKit

class ViewController: UITabBarController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nextButton = UIButton()
        
        nextButton.backgroundColor = .systemBlue
        nextButton.setTitle("Next Button", for: .normal)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            
            nextButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            nextButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            nextButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
            
        ])
        
        nextButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        

    }

    @objc  private func didTapButton() {
        let vc = SecondViewController()
        vc.view.backgroundColor = .blue
        self.navigationController?.pushViewController(vc, animated: true)
//        self.present(vc, animated: true, completion: nil)
        
    }
}

    


