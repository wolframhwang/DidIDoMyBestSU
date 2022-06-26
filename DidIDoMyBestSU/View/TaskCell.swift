//
//  TaskCell.swift
//  DidIDoMyBestSU
//
//  Created by 황지웅 on 2022/06/27.
//

import SwiftUI

struct TaskCell: View {
    @ObservedObject var task: TaskEntity
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(task.title ?? "")
                .font(.body)
                .lineLimit(1)
            
            Text(task.content ?? "")
                .font(.caption)
                .lineLimit(1)
                .foregroundColor(.secondary)
        }
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskCell(task: TaskEntity(context: CoreDataManager.shared.mainContext))
    }
}
