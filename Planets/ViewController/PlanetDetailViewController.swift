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
    
    var planet : PlanetEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let planet = planet {
            
            planetName.text = planet.name 
            population.text = "Population : \(String(describing: planet.population ?? ""))"
            climate.text    = "Climate : \(String(describing: planet.climate ?? ""))"
            terrain.text    = "Terrain : \(String(describing: planet.terrain ?? ""))"
            gravity.text    = "Gravity : \(String(describing: planet.gravity ?? ""))"
            diameter.text   = "Diameter : \(String(describing: planet.diameter ?? ""))"
        }
    }
    
    
}
