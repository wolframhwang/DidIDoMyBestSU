//
//  DetailView.swift
//  DidIDoMyBestSU
//
//  Created by 황지웅 on 2022/06/27.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var manager: CoreDataManager
    
    @ObservedObject var task: TaskEntity
    
    @State private var showComposer = false
    @State private var deleteAlert = false
    
    @State private var title = ""
    @State private var content = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            ScrollView {
                HStack {
                    Text(task.content ?? "")
                        .padding()
                    
                    Spacer(minLength: 0)
                }
                
                Text(task.insertDate ?? .now, style: .date)
                    .padding()
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        }
        .navigationTitle(task.title ?? "제목")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar){
                Button {
                    deleteAlert = true
                } label: {
                    Image(systemName: "trash")
                }
                .foregroundColor(.red)
                .alert("삭제 확인", isPresented: $deleteAlert) {
                    Button(role: .destructive) {
                        manager.delete(task: task)
                        dismiss()
                    } label: {
                        Text("삭제")
                    }
                } message: {
                    Text("메모를 삭제 할깝쇼")
                }
                
                
                Button {
                    showComposer = true
                } label: {
                    Image(systemName: "square.and.pencil")
                }
            }
        }
        .sheet(isPresented: $showComposer) {
            ComposeView(task: task)
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(task: TaskEntity(context: CoreDataManager.shared.mainContext))
            .environmentObject(CoreDataManager.shared)
    }
}
