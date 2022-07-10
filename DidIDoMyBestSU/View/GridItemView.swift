//
//  GridItemView.swift
//  DidIDoMyBestSU
//
//  Created by 황지웅 on 2022/07/10.
//

import SwiftUI

struct GridItemView: View {
    let task: TaskEntity
    
    init(task: TaskEntity) {
        self.task = task
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(task.title ?? "제목")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding()
            
            Text(task.content ?? "내용")
                .font(.caption)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.black)
                .padding()
            
            Spacer()
        }
    }
}

struct GridItemView_Previews: PreviewProvider {
    static var previews: some View {
        GridItemView(task: TaskEntity(context: CoreDataManager.shared.mainContext))
            .environmentObject(CoreDataManager.shared)
    }
}
