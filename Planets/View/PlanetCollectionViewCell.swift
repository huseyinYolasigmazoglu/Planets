//
//  PlanetCollectionViewCell.swift
//  Planets
//
//  Created by Huseyin Yolasigmazoglu on 24/01/2021.
//

import UIKit

class PlanetCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var planetName: UILabel!
    
    
    override func prepareForReuse() {
        
        planetName.text = nil
    }
    
    func configure(_ planet:PlanetEntity?)  {
        
        if let planet = planet {
            planetName.text = planet.name
        }
    }
    
}
