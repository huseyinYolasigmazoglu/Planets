//
//  PlanetViewModel.swift
//  Planets
//
//  Created by Huseyin Yolasigmazoglu on 25/01/2021.
//

import Foundation

struct PlanetViewModel  {
    
    let name : String 
    let population : String
    let climate : String
    let terrain : String
    let gravity : String
    let diameter: String
    
    init(planet: Planet?){
        
        if let planet = planet {
            name = planet.name ?? ""
            population = planet.population ?? ""
            climate = planet.climate ?? ""
            terrain = planet.terrain ?? ""
            gravity = planet.gravity ?? ""
            diameter = planet.diameter ?? ""
        }
        else{
            name = ""
            population = ""
            climate = ""
            terrain =  ""
            gravity =  ""
            diameter = "" 
        }
    }
}
