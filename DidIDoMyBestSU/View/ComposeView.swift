//
//  ComposeView.swift
//  DidIDoMyBestSU
//
//  Created by 황지웅 on 2022/06/27.
//

import SwiftUI

struct ComposeView: View {
    @EnvironmentObject var manager: CoreDataManager
    
    var task: TaskEntity? = nil
    
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var content: String = "내용"
    
    var body: some View {
        NavigationView {
            GeometryReader { reader in
                ScrollView {
                    VStack {
                        TextField(text: $title) {
                            Text("제목")
                        }
                        .padding()
                        .onAppear {
                            if let task = task?.title {
                                title = task
                            }
                        }
                        .frame(height: 30)
                        
                        TextEditor(text: $content)
                            .padding()
                            .onAppear {
                                if let task = task?.content {
                                    content = task
                                }
                            }
                            .onTapGesture(perform: {
                                content = ""
                            })
                            .frame(height: reader.size.height / 3)
                    }
                }
            }
            .navigationTitle(task == nil ? "New Task" : "Editor")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        dismiss
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        if let task = task {
                            manager.update(task: task, title: title, content: content)
                        } else {
                            manager.addTask(title: title, content: content)
                        }
                        dismiss()
                    } label: {
                        Text("Submit")
                            .foregroundColor(.black)
                    }
                }
                
            }
        }
        
    }
}

struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeView()
    }
}
