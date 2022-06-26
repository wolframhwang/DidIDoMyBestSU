//
//  TodoListView.swift
//  DidIDoMyBestSU
//
//  Created by 황지웅 on 2022/06/26.
//

import SwiftUI

struct TodoListView: View {
    @EnvironmentObject var manager: CoreDataManager
    
    @State private var composer: Bool = false
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\TaskEntity.insertDate, order: .reverse)])
    var taskList: FetchedResults<TaskEntity>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(taskList) { task in
                    NavigationLink {
                        
                    } label: {
                        TaskCell(task: task)
                    }
                }
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    composer = true
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                }
            }
            .sheet(isPresented: $composer) {
                ComposeView()
            }
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
            .environmentObject(CoreDataManager.shared)
    }
}
