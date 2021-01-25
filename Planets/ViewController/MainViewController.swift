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
    private var planet = PlanetWebService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewCellWidth = (self.view.frame.width) / 2 - 15
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        planet.getAllPlanets { (allPlanets) in
                        
            self.planetListViewModel = PlanetListViewModel(planets: allPlanets)
            
            self.collectionView.reloadData()
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let identifier = segue.identifier {
            
            if identifier == Constants.goToPlanetDetailViewSegue {
                
                if let destinationViewController = segue.destination as? PlanetDetailViewController {
                    
                    if let index = sender as? IndexPath {
                        
                        destinationViewController.planet = planetListViewModel?.planetAtIndex(index.row)
                    }
                }
                
            }
            
        }
    }
    
    
}

//MARK: - UICollectionView extensions - DataSource
extension MainViewController :UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.planetListViewModel?.numberOfSections ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlanetCell", for: indexPath) as? PlanetCollectionViewCell else {
            fatalError("PlanetCollectionViewCell not found")
        }
        
        cell.configure(planetListViewModel?.planetAtIndex(indexPath.row))
        
        return cell
        
    }
    
}

//MARK: - UICollectionView extensions - Layout
extension MainViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionViewCellWidth, height: collectionViewCellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: Constants.goToPlanetDetailViewSegue, sender: indexPath)
    }
    
}

