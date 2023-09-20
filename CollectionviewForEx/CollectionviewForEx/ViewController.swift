//
//  ViewController.swift
//  CollectionviewForEx
//
//  Created by  on 2023/09/20.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let dataList = Reminder.sampleData

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        collectionView.register(UINib(nibName: "RemindCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "RemindCollectionViewCell")

        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RemindCollectionViewCell", for: indexPath) as? RemindCollectionViewCell else {
            return UICollectionViewCell()

        }
            return cell
    }
    
    

}

