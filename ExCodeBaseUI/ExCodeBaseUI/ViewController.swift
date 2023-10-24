//
//  ViewController.swift
//  ExCodeBaseUI
//
//  Created by 장익준 on 2023/10/21.
//

import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nextButton = UIButton()
        
        
        nextButton.backgroundColor = .systemBlue
        nextButton.setTitle("Next Button", for: .normal)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(nextButton)

        NSLayoutConstraint.activate([
            //            nextButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            //            nextButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            //
            //            nextButton.heightAnchor.constraint(equalToConstant: 44),
            //            nextButton.widthAnchor.constraint(equalToConstant: 200)
            
            nextButton.topAnchor.constraint(equalTo: self.view.topAnchor),
            nextButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            nextButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
            
        ])
        
        nextButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        
        
        
    }

    @objc  private func didTapButton() {
        let vc = UIViewController()
        vc.view.backgroundColor = .blue
        //뷰컨 인스턴스 생성
        self.navigationController?.pushViewController(vc, animated: true)
//        self.present(vc, animated: true, completion: nil)
        
    }
}

    


