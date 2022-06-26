//
//  CoreDataManager.swift
//  DidIDoMyBestSU
//
//  Created by 황지웅 on 2022/06/26.
//

import Foundation
import CoreData
import SwiftUI

class CoreDataManager: ObservableObject {
    static let shared = CoreDataManager()
    
    let container: NSPersistentContainer
    
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
        
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "DidIDoMyBestSU")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func saveContext() {
        if mainContext.hasChanges {
            do {
                try mainContext.save()
            } catch {
                print(error)
            }
        }
    }
    
    func addTask(title: String, content: String) {
        let newTask = TaskEntity(context: mainContext)
        newTask.title = title
        newTask.content = content
        newTask.insertDate = Date.now
        
        saveContext()
    }
    
    
    func update(task: TaskEntity?, title: String, content: String) {
        task?.title = title
        task?.content = content
        saveContext()
    }
    
    func delete(task: TaskEntity?) {
        if let task = task {
            mainContext.delete(task)
            saveContext()
        }
    }
}
