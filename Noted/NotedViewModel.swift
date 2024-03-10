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
    var container = Persistence.shared.container
    
    init() {
        self.fetchNotes()
    }
    func fetchNotes(){
        let request = NSFetchRequest<Noted>(entityName: "Noted")
         
        do{
            notes = try container.viewContext.fetch(request)
        } catch let error{
            print("error fetching: \(error)")
        }
    }
    func addNotes(headline: String, text: String) {
        let newNote = Noted(context: container.viewContext)
        newNote.headline = headline
        newNote.text = text
        
        saveData()
    }


    
    func updateNotes(entity: Noted, newHeadline: String, newText: String) {
        // Ensure you are using the provided values directly
        entity.headline = newHeadline
        entity.text = newText
        // Update your notes array or perform necessary actions
    }
    func deleteNotes(indexSet: IndexSet){
        guard let index = indexSet.first else {return}
        let entity = notes[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    func saveData(){
        do{
            try container.viewContext.save()
        }catch let error{
            print("error adding notes \(error)")
        }
        fetchNotes()
    }
}
