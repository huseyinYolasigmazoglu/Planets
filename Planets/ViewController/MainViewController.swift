//
//  ViewController.swift
//  Planets
//
//  Created by Huseyin Yolasigmazoglu on 24/01/2021.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var planetListViewModel : PlanetListViewModel?
    
    private var collectionViewCellWidth : CGFloat = 180
    private var planet = PlanetWebService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        
        collectionViewCellWidth = (self.view.frame.width) / 2 - 15
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        getPlanets()
    }
    
    func getPlanets()  {
        
        planet.getAllPlanets { [weak self] (allPlanets) in
            
            DispatchQueue.main.async {
                self?.planetListViewModel = PlanetListViewModel(planets: allPlanets, delegate: self)
            }
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

extension MainViewController : PlanetListViewModelDelegate {
    
    func refresh() {
        DispatchQueue.main.async {
            
            self.activityIndicator.stopAnimating()
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
        
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.PlanetCell, for: indexPath) as? PlanetCollectionViewCell
        else {
            fatalError("PlanetCollectionViewCell not found")
        }
        
        cell.configure(self.planetListViewModel?.planetAtIndex(indexPath.row))
        
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

