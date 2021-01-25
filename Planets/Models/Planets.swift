//
//  Planets.swift
//  Planets
//
//  Created by Huseyin Yolasigmazoglu on 24/01/2021.
//

import Foundation


struct Planets: Codable {
    
    let count:Int?
    let next:String?
    let results : [Planet?]
}

struct Planet : Codable {
    
    let name : String?
    let population : String?
    let climate : String?
    let terrain : String?
    let gravity : String?
    let diameter: String?
}
