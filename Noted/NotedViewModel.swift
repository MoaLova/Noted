//
//  NotedViewModel.swift
//  Noted
//
//  Created by Moa.Svensson on 2024-03-07.
//

import Foundation
import CoreData

class NotedViewModel: ObservableObject{
    @Published var notes: [Noted] = []
    // Core Data container reference
        var container = Persistence.shared.container
    
    init() {
        self.fetchNotes()
    }
    
    //function to fetch the notes by coredata
    func fetchNotes(){
        let request = NSFetchRequest<Noted>(entityName: "Noted")
         
        do{
            notes = try container.viewContext.fetch(request)
        } catch let error{
            print("error fetching: \(error)")
        }
    }
    
    
    //function to add the notes by coredata
    func addNotes(headline: String, text: String) {
        let newNote = Noted(context: container.viewContext)
        newNote.headline = headline
        newNote.text = text
        
        saveData()
    }


    
    //function to update the notes by coredata
    func updateNotes(entity: Noted, newHeadline: String, newText: String) {
        entity.headline = newHeadline
        entity.text = newText
        saveData()
    }
    
    
    //function to delete the notes by coredata
    func deleteNotes(entity: Noted) {
           container.viewContext.delete(entity)

           do {
               try container.viewContext.save()
           } catch {
               print("Error deleting entity: \(error)")
           }
           
           fetchNotes()
       }

    
    //function to save the notes by coredata 
    func saveData(){
        do{
            try container.viewContext.save()
        }catch let error{
            print("error adding notes \(error)")
        }
        fetchNotes()
    }
}
