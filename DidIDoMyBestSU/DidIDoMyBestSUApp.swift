//
//  DidIDoMyBestSUApp.swift
//  DidIDoMyBestSU
//
//  Created by 황지웅 on 2022/06/26.
//

import SwiftUI

@main
struct DidIDoMyBestSUApp: App {
    let manager = CoreDataManager.shared

    var body: some Scene {
        WindowGroup {
            TodoListView()
                .environment(\.managedObjectContext, manager.mainContext)
                .environmentObject(manager)
        }
    }
}
