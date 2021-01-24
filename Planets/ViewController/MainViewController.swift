//
//  ViewController.swift
//  Planets
//
//  Created by Huseyin Yolasigmazoglu on 24/01/2021.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var planetListViewModel : PlanetListViewModel?
    
    private var collectionViewCellWidth : CGFloat = 180
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewCellWidth = (self.view.frame.width) / 2 - 15
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let p = PlanetWebService()
        p.getAllPlanets { (allPlanets) in
            
            print("hey")
            print(allPlanets.count)
            
            self.planetListViewModel = PlanetListViewModel(planets: allPlanets)
            
            self.collectionView.reloadData()
        }
    }
    
}

//MARK: - UICollectionView extensions - DataSource
extension MainViewController :UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.planetListViewModel?.numberOfSections ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlanetCell", for: indexPath)
        
        return cell
        
    }
    
}

//MARK: - UICollectionView extensions - FlowLayout
extension MainViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionViewCellWidth, height: collectionViewCellWidth)
    }
}

