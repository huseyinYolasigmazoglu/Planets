//
//  PlanetListViewModel.swift
//  Planets
//
//  Created by Huseyin Yolasigmazoglu on 24/01/2021.
//

import Foundation

struct PlanetListViewModel {
    
    private(set) var planets: [Planet?]
    
    func planetAtIndex(_ index: Int) -> Planet? {
        
        if index >= 0 && index < planets.count {
            return planets[index]
        }
        else
        {
            return nil 
        }
    }
    
    var numberOfSections: Int {
        return self.planets.count
    }
}
