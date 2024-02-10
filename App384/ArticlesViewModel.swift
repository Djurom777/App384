//
//  ArticlesViewModel.swift
//  App384
//
//  Created by DJUROM on 03/02/2024.
//

import SwiftUI
import CoreData

final class ArticlesViewModel: ObservableObject {

    @Published var artHeadliner: String = ""
    @Published var artCat: String = ""
    @Published var artStatus: String = ""
    @Published var artPublisher: String = ""
    @Published var artText: String = ""

    @Published var categories: [String] = ["basketball", "footvall", "volleyball", "hockey", "box", "golf", "other"]
    @Published var currentCat = ""
    
    @Published var statusVariant: [String] = ["Writing", "Sended", "Published", "Archieve"]
    @Published var currentStatus = ""
    
    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false

    @Published var articles: [ArticlesModel] = []
    @Published var selectedArticle: ArticlesModel?
    
    func addArticle(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "ArticlesModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "ArticlesModel", into: context) as! ArticlesModel
        
        sub.artHeadliner = artHeadliner
        sub.artCat = artCat
        sub.artStatus = artStatus
        sub.artPublisher = artPublisher
        sub.artText = artText
        
        CoreDataStack.shared.saveContext()
        
        completion()

    }
    
    func fetchArticles() {
        
        CoreDataStack.shared.modelName = "ArticlesModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ArticlesModel>(entityName: "ArticlesModel")
        
        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.articles = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.articles = []
        }
    }
}
