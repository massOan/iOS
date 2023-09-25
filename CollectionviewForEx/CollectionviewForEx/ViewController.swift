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
        
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)

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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
        
        return header
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout : UICollectionViewLayout, referenceSizeForHeaderInSection section : Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 200)
    }
    
}
