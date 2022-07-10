//
//  CalendarView.swift
//  DidIDoMyBestSU
//
//  Created by 황지웅 on 2022/07/10.
//

import SwiftUI

struct GridTaskView: View {
    @FetchRequest(sortDescriptors: [SortDescriptor(\TaskEntity.insertDate, order: .reverse)])
    var taskList: FetchedResults<TaskEntity>
    
    private let columns = [
        GridItem(.adaptive(minimum: 100, maximum: .infinity))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(taskList) { task in
                    GridItemView(task: task)
                        .background(.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 10))
                }
            }
            .padding()
        }
    }
}

struct GridTaskView_Previews: PreviewProvider {
    static var previews: some View {
        GridTaskView()
    }
}
