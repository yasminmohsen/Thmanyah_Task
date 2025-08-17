//
//  ContentView.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 14/08/2025.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Initializer
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemGray6
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    //MARK: - Body
    var body: some View {
        MainTabView()
    }
}
#Preview {
    ContentView()
}
