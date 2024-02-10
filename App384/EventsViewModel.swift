//
//  EventsViewModel.swift
//  App384
//
//  Created by DJUROM on 03/02/2024.
//

import SwiftUI
import CoreData

final class EventsViewModel: ObservableObject {

    @Published var evHeadline: String = ""
    @Published var evArena: String = ""
    @Published var evDate: String = ""
    @Published var evTeam1: String = ""
    @Published var evTeam2: String = ""
    @Published var evPT1: String = ""
    @Published var evPT2: String = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false

    @Published var events: [EventsModel] = []
    @Published var selectedEvents: EventsModel?
    
    func addEvent(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "EventsModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "EventsModel", into: context) as! EventsModel
        
        sub.evHeadline = evHeadline
        sub.evArena = evArena
        sub.evDate = evDate
        sub.evTeam1 = evTeam1
        sub.evTeam2 = evTeam2
        sub.evPT1 = evPT1
        sub.evPT2 = evPT2
        
        CoreDataStack.shared.saveContext()
        
        completion()

    }
    
    func fetchEvents() {
        
        CoreDataStack.shared.modelName = "EventsModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<EventsModel>(entityName: "EventsModel")
        
        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.events = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.events = []
        }
    }
}

