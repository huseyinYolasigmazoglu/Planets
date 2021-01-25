//
//  PlanetDetailViewController.swift
//  Planets
//
//  Created by Huseyin Yolasigmazoglu on 25/01/2021.
//

import UIKit

class PlanetDetailViewController: UIViewController {

    var planet : Planet? {
        didSet{
            if let planet = planet {
                print(planet.name ?? "")
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
