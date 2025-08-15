//
//  ContentView.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 14/08/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            Task {
                do {
                  let homeArr = try await HomeRepository(remoteDataSource: HomeRemoteDataSource(networkManager: NetworkManager.shared)).getHomeSections(page: nil)
                    homeArr.forEach({ print ($0.name)})
                } catch(let error) {
                    print("Error -> \(error.localizedDescription)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
