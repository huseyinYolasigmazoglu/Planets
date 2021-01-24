//
//  PlanetWebService.swift
//  Planets
//
//  Created by Huseyin Yolasigmazoglu on 24/01/2021.
//

import Foundation

class PlanetWebService {
    
    func getAllPlanets(completion: @escaping (Planets) -> ()) {
        
        Webservice().load(resource()) { (planets) in
            
            print(planets?.count ?? 0)
            print(planets?.next ?? 0)
        }
        
    }
    
    func resource() -> Resource<Planets> {
        
        
        let urlLink = "https://swapi.dev/api/planets/"
        
        return Resource<Planets>( url: URL(string: urlLink)!)  { data in
            return try! JSONDecoder().decode(Planets.self, from: data)
        }
        
    }
    
    
}
