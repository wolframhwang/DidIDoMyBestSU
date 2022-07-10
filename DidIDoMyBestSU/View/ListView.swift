//
//  ListView.swift
//  DidIDoMyBestSU
//
//  Created by 황지웅 on 2022/07/06.
//

import SwiftUI

struct ListView: View {
    @FetchRequest(sortDescriptors: [SortDescriptor(\TaskEntity.insertDate, order: .reverse)])
    var taskList: FetchedResults<TaskEntity>
    
    var body: some View {
        List {
            ForEach(taskList) { task in
                NavigationLink {
                    DetailView(task: task)
                } label: {
                    TaskCell(task: task)
                }
            }
            
        }
        .listStyle(.plain)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
