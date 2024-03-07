//
//  Persistence.swift
//  Noted
//
//  Created by Moa.Svensson on 2024-03-06.
//

import Foundation
import CoreData

struct Persistence{
    static let shared = Persistence()
    
    let container: NSPersistentContainer
    init() {
        container = NSPersistentContainer(name: "NotedModel")
        
        container.loadPersistentStores { (description, error) in
            
            if let error = error{
                print("Error loading core data: \(error)")
            }else{
                print("Succsess!")
            }
        
        }
    }
}
