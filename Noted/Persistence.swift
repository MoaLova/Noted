//
//  Persistence.swift
//  Noted
//
//  Created by Moa.Svensson on 2024-03-06.
//

import Foundation
import CoreData

struct Persistence{
    // Singleton instance of Persistence
    static let shared = Persistence()
    
    // Core Data container
    let container: NSPersistentContainer
    
    // Initializer to set up the Core Data stack
    init() {
        container = NSPersistentContainer(name: "NotedModel")
        
        // Load the persistent stores asynchronously
        
        container.loadPersistentStores { (description, error) in
            
            if let error = error{
                print("Error loading core data: \(error)")
            }else{
                print("Succsess!")
            }
        
        }
    }
}
