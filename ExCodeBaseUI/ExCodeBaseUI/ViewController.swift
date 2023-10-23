//
//  ViewController.swift
//  ExCodeBaseUI
//
//  Created by 장익준 on 2023/10/21.
//

import UIKit

class ViewController: UIViewController {

    
    var nextButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
        setUpButton()
    }
    
    func setUpButton() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.configuration? = .filled()
        nextButton.configuration?.title = "Next"
        
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
    private func setUI() {
    let  backgroundImage = UIImageView(frame: UIScreen.main.bounds)
         backgroundImage.backgroundColor = .green
         backgroundImage.contentMode = .scaleAspectFill

         self.view.addSubview(backgroundImage)
        
        //addSubView, InsertSubView의 차이
        
    }
    
 }


