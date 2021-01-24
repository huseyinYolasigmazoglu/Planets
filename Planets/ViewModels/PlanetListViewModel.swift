//
//  PlanetListViewModel.swift
//  Planets
//
//  Created by Huseyin Yolasigmazoglu on 24/01/2021.
//

import Foundation

struct PlanetListViewModel {
    
    private(set) var planets: [Planet?]
    
    var numberOfSections: Int {
        return self.planets.count
    }
}
