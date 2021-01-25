//
//  PlanetCollectionViewCell.swift
//  Planets
//
//  Created by Huseyin Yolasigmazoglu on 24/01/2021.
//

import UIKit

class PlanetCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var planetName: UILabel!
    
    
    func configure(_ planet:Planet?)  {
        
        if let planet = planet {
            planetName.text = planet.name
        }
    }
    
}
