//
//  PostsViewModel.swift
//  App384
//
//  Created by DJUROM on 03/02/2024.
//

import SwiftUI
import CoreData

final class PostsViewModel: ObservableObject {

    @Published var postName: String = ""
    @Published var postText: String = ""
    @Published var postDate: Date = Date()

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false

    @Published var posts: [PostModel] = []
    @Published var selectedPost: PostModel?
    
    func addPost(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "PostModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "PostModel", into: context) as! PostModel
        
        sub.postName = postName
        sub.postText = postText
        sub.postDate = postDate
        
        CoreDataStack.shared.saveContext()
        
        completion()

    }
    
    func fetchPosts() {
        
        CoreDataStack.shared.modelName = "PostModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PostModel>(entityName: "PostModel")
        
        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.posts = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.posts = []
        }
    }
}

