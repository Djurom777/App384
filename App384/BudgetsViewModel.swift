//
//  BudgetsViewModel.swift
//  App384
//
//  Created by DJUROM on 03/02/2024.
//

import SwiftUI
import CoreData

final class BudgetsViewModel: ObservableObject {

    @Published var budType: String = ""
    @Published var budTitle: String = ""
    @Published var budDate: String = ""
    @Published var budSum: String = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    
    @Published var categories: [String] = ["Income", "Expenses"]
    @Published var currentCat = "Income"
    
    @Published var types: [String] = ["Income", "Expenses"]
    @Published var currentType = ""

    @Published var budgets: [BudgetsModel] = []
    @Published var selectedBudget: BudgetsModel?
    
    func addBudget(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "BudgetsModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "BudgetsModel", into: context) as! BudgetsModel
        
        sub.budType = budType
        sub.budTitle = budTitle
        sub.budDate = budDate
        sub.budSum = budSum
        
        CoreDataStack.shared.saveContext()
        
        completion()

    }
    
    func fetchBudgets() {
        
        CoreDataStack.shared.modelName = "BudgetsModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<BudgetsModel>(entityName: "BudgetsModel")
        
        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.budgets = branch.filter{currentCat == $0.budType}
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.budgets = []
        }
    }
}
