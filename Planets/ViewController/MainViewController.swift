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
        
        let p = PlanetWebService()
        p.getAllPlanets { (planets) in
            
            print(planets.count ?? 0)
            print(planets.next ?? 0)
        }
    }


}

