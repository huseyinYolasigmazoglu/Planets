//
//  ViewController.swift
//  Planets
//
//  Created by Huseyin Yolasigmazoglu on 24/01/2021.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var p = PlanetWebService()
        p.getAllPlanets { (planets) in
            
            print(planets.count)
            print(planets.next)
        }
    }


}

