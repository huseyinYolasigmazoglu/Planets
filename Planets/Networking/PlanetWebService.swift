//
//  PlanetWebService.swift
//  Planets
//
//  Created by Huseyin Yolasigmazoglu on 24/01/2021.
//

import Foundation

class PlanetWebService {
    
    var urlLink : String = Constants.testUrl
    
    func getAllPlanets(completion: @escaping ([Planet?]?) -> ()) {
        
        Webservice().load(resource()) { (planets) in
            
            guard let allPlanets = planets else {
                completion(nil)
                return
            }
            DispatchQueue.main.async {
                completion(allPlanets.results)
            }
        }
    }
    
    func resource() -> Resource<Planets> {
        
        return Resource<Planets>( url: URL(string: urlLink)!)  { data in
            return try! JSONDecoder().decode(Planets.self, from: data)
        }
    }
}
