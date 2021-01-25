//
//  PlanetDetailViewController.swift
//  Planets
//
//  Created by Huseyin Yolasigmazoglu on 25/01/2021.
//

import UIKit

class PlanetDetailViewController: UIViewController {
    
    
    @IBOutlet private weak var planetName: UILabel!
    
    @IBOutlet private weak var population: UILabel!
    
    @IBOutlet private weak var climate: UILabel!
    
    @IBOutlet private weak var terrain: UILabel!
    
    @IBOutlet private weak var gravity: UILabel!
    
    @IBOutlet private weak var diameter: UILabel!
    
    var planet : PlanetViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let planet = planet {
            
            planetName.text = planet.name 
            population.text = "Population : \(planet.population)"
            climate.text    = "Climate : \(planet.climate)"
            terrain.text    = "Terrain : \(planet.terrain)"
            gravity.text    = "Gravity : \(planet.gravity)"
            diameter.text   = "Diameter : \(planet.diameter)"
        }
    }
    

}
