//
//  DidIDoMyBestSUApp.swift
//  DidIDoMyBestSU
//
//  Created by 황지웅 on 2022/06/26.
//

import SwiftUI

@main
struct DidIDoMyBestSUApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
