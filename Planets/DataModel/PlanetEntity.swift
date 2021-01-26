//
//  PlanetEntity.swift
//  Planets
//
//  Created by Huseyin Yolasigmazoglu on 25/01/2021.
//

import Foundation
import CoreData


public class PlanetEntity: NSManagedObject {
    
    convenience init(planet: Planet?,context con: NSManagedObjectContext)  {
        
        self.init(context: con)
        
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
