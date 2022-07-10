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
    @State private var menuChecker: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                ListView()
                    .navigationTitle("To Do List")
                    .navigationBarTitleDisplayMode(.inline)
                    .disabled(menuChecker)
                    .opacity(menuChecker ? 0: 1)
                
                GridTaskView()
                    .disabled(!menuChecker)
                    .opacity(!menuChecker ? 0: 1)
                
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $composer) {
                ComposeView()
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Menu {
                        Button {
                            menuChecker = false
                        } label: {
                            HStack {
                                Text("Task List")
                                Image(systemName: !menuChecker ? "checkmark": "")
                            }
                        }
                        
                        Button {
                            menuChecker = true
                        } label: {
                            HStack {
                                Text("Grid List")
                                Image(systemName: menuChecker ? "checkmark" : "")
                            }
                            Label("Calendar", systemImage: "checkmark")
                        }
                        
                    } label: {
                        Label("", systemImage: "line.horizontal.3")
                            .tint(.black)
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        composer = true
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                    }
                }
                
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
