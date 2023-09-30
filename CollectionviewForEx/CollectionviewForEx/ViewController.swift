//
//  ViewController.swift
//  CollectionviewForEx
////

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate let headerId = "headerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        collectionView.backgroundColor = .systemBackground
        
        collectionView.register(UINib(nibName: "RemindCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "RemindCollectionViewCell")
        
        collectionView.register(UINib(nibName: String(describing: CustomHeaderView.self), bundle: .main),
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: String(describing: CustomHeaderView.self))
        collectionView.register(UINib(nibName: String(describing: CustomFooterView.self), bundle: .main),
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                withReuseIdentifier: String(describing: CustomFooterView.self))
        
        reminderCellRegistration()
        
        func reminderCellRegistration() ->
        UICollectionView.CellRegistration<UICollectionViewListCell, Reminder > {
            return .init { cell, indexpath, item in
                var contentConfiguration = UIListContentConfiguration.valueCell()
                var configuration = cell.defaultContentConfiguration()
                configuration.text = "Loading"
                configuration.textProperties.color = .darkGray
                cell.contentConfiguration = configuration
                
                var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
                cell.backgroundConfiguration = backgroundConfig
                
                
                cell.contentConfiguration = contentConfiguration
                  cell.accessories = [
                      .outlineDisclosure(displayed: .always),
                      .disclosureIndicator(displayed: .always),
                      .reorder(displayed: .always),
                      .checkmark(displayed: .always)
                      
                  ]
                
            }
            
            
            
            
        }
        
    }
    
}
extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Reminder.sampleData.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RemindCollectionViewCell", for: indexPath) as! RemindCollectionViewCell
        
        let reminder = Reminder.sampleData[indexPath.item]
        
        cell.TodoTitle.text = reminder.title
        cell.TodoTitle.sizeToFit()
        
        cell.TodoDescription.text = reminder.notes
        cell.TodoDescription.sizeToFit()
        
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 1
        
        cell.layer.masksToBounds = false
        cell.layer.shadowOpacity = 0.8
        cell.layer.shadowOffset = CGSize(width: -1, height: 1 )
        cell.layer.shadowRadius = 2
        
        return cell
    }    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            return collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                   withReuseIdentifier: String(describing: CustomHeaderView.self),
                                                                   for: indexPath) as? CustomHeaderView ?? UICollectionReusableView()
        case UICollectionView.elementKindSectionFooter:
            return collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                   withReuseIdentifier: String(describing: CustomFooterView.self),
                                                                   for: indexPath) as? CustomFooterView ?? UICollectionReusableView()
        default:
            return UICollectionReusableView()
        }
    }
    
}

