//
//  MainTabView.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 17/08/2025.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}

#Preview {
    MainTabView()
}

