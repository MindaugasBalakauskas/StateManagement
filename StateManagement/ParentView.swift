//
//  ParentView.swift
//  StateManagement
//
//  Created by M Balakauskas on 21/10/2025.
//

import SwiftUI

struct ParentView: View {
    
    enum Tabs: Hashable {
        case todos
        case about
    }
    @State var selectedTab: Tabs = .todos
    
    var body: some View {
        TabView (selection: $selectedTab){
            TodoItemsListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("TODOs")
                }
                .tag(Tabs.todos)
            AboutView()
                .tabItem {
                    Image(systemName: "questionmark.circle.fill")
                    Text("About")
                }
                .tag(Tabs.about)
        }
        .onChange(of: selectedTab) { oldValue, newValue in
            print("Tab changed from", String(describing: oldValue), "to", String(describing: newValue))
        }
    }
}

