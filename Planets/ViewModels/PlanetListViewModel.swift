//
//  PlanetListViewModel.swift
//  Planets
//
//  Created by Huseyin Yolasigmazoglu on 24/01/2021.
//

import Foundation
import UIKit
import CoreData


//MARK: -protocol
protocol PlanetListViewModelDelegate : class  {
    
    func refresh()
}

//MARK: - PlanetListViewModel Main
class PlanetListViewModel {
    
    private var planets: [Planet?]
    
    private weak var delegate : PlanetListViewModelDelegate?
    
    private var planetEntities: [PlanetEntity?] = [PlanetEntity?]()
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    init(planets:[Planet?]? , delegate : PlanetListViewModelDelegate? ) {
        
        self.delegate = delegate
        
        if let planets = planets {
            
            self.planets = planets
            deleteAllCoreData()
            transform()
            save()
        }
        else{
            self.planets = [Planet?]()
            load()
        }
    }
    
    func transform() {
        
        for item in planets {
            
            planetEntities.append(PlanetEntity(planet: item, context: context))
            
        }
        
        self.delegate?.refresh()
        
    }
    
    func planetAtIndex(_ index: Int) -> PlanetEntity? {
        
        if index >= 0 && index < planetEntities.count {
            return planetEntities[index]
        }
        else{
            return nil
        }
    }
    
    var numberOfSections: Int {
        return self.planetEntities.count
    }
}

//MARK: - PlanetListViewModel Extensin for CoreData

extension PlanetListViewModel {
    
    func save()  {
        do {
            try context.save()
        } catch  {
            print("Error context.save()")
        }
    }
    
    func load()  {
        
        let request : NSFetchRequest<PlanetEntity> = PlanetEntity.fetchRequest()
        do {
            self.planetEntities =  try self.context.fetch(request)
        } catch  {
            print("Error context.fetch(request)")
        }
        
        self.delegate?.refresh()
        
    }
    
    func deleteAllCoreData()  {
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "PlanetEntity")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(deleteRequest)
        } catch let error as NSError {
            print(error)
        }
    }
}
