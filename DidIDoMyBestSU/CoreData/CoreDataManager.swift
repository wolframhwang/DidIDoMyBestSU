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
        container = NSPersistentContainer(name: "SwiftUIMemo")
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
    
    func addMemo(content: String) {
        let newMemo = TaskEntity(context: mainContext)
        newMemo.content = content
        newMemo.insertDate = Date.now
        
        saveContext()
    }
    
    
    func update(memo: TaskEntity?, content: String) {
        memo?.content = content
        saveContext()
    }
    
    func delete(memo: TaskEntity?) {
        if let memo = memo {
            mainContext.delete(memo)
            saveContext()
        }
    }
}
