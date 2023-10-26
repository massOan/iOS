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

//    private func setUI() {
//    let  backgroundImage = UIImageView(frame: UIScreen.main.bounds)
//         backgroundImage.backgroundColor = .green
//         backgroundImage.contentMode = .scaleAspectFill
//
//         self.view.addSubview(backgroundImage)
//
//        //addSubView, InsertSubView의 차이
//    }
    
    
    @objc private func didTapButton() {
        let vc = SecondViewController()
        vc.view.backgroundColor = .blue
        
        self.navigationController?.pushViewController(vc, animated: true)
//      self.present(vc, animated: true, completion: nil)
        
    }
}
