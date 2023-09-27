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
extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Reminder.sampleData.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RemindCollectionViewCell", for: indexPath) as! RemindCollectionViewCell
        
        let reminder = Reminder.sampleData[indexPath.item]
        
        cell.TodoTitle.text = reminder.title
        cell.TodoTitle.sizeToFit()
        
        cell.TodoDescription.text = reminder.notes
        cell.TodoDescription.sizeToFit()
        
        cell.layer.cornerRadius = 8
        
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

