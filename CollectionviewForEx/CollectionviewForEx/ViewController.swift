//
//  ViewController.swift
//  CollectionviewForEx
////

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(UINib(nibName: "RemindCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "RemindCollectionViewCell")
        

        
        func reminderCellRegistration() ->
        UICollectionView.CellRegistration<UICollectionViewListCell, Reminder > {
            return .init { cell, indexpath, item in
                
                var configuration = cell.defaultContentConfiguration()
                configuration.text = "Loading"
                configuration.textProperties.color = .darkGray
                cell.contentConfiguration = configuration
                
                var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
                cell.backgroundConfiguration = backgroundConfig
            }
        }
        
    }
    
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Reminder.sampleData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RemindCollectionViewCell", for: indexPath) as! RemindCollectionViewCell
        
        let reminder = Reminder.sampleData[indexPath.item]
        
        cell.TodoTitle.text = reminder.title
        cell.TodoTitle.sizeToFit()
        
        cell.TodoDescription.text = reminder.notes
        cell.TodoDescription.sizeToFit()
    
        cell.layer.cornerRadius = 8
        //
        return cell
    }
}
