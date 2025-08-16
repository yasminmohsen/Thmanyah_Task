//
//  LoadingStateHomeView.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 17/08/2025.
//

import SwiftUI

struct LoadingStateHomeView: View {
    @State private var opacity: Double = 0.2
    
    var body: some View {
        ZStack (alignment: .topLeading) {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width:200, height: 30)
                        .padding(.top, 40)
                        .padding(.bottom, 16)
                        .setShimmerEffect(opacity: $opacity)
                    Spacer()
                }
                
                LazyHGrid(rows: [GridItem(.flexible())], spacing: 6) {
                    ForEach(0..<5) { _ in
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.gray.opacity(0.3))
                            .frame(width:270, height: 180)
                            .setShimmerEffect(opacity: $opacity)
                    }
                    
                }.frame(width:270, height: 180)
                
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width:200, height: 30)
                    .padding(.top, 40)
                    .padding(.bottom, 16)
                    .setShimmerEffect(opacity: $opacity)
                
                LazyHGrid(rows: [GridItem(.flexible())], spacing: 6) {
                    ForEach(0..<5) { _ in
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.gray.opacity(0.3))
                            .frame(width:80, height: 80)
                            .setShimmerEffect(opacity: $opacity)
                    }
                    
                }.frame(width:80, height: 80)
                
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width:200, height: 30)
                    .padding(.top, 40)
                    .padding(.bottom, 16)
                    .setShimmerEffect(opacity: $opacity)
                
                LazyHGrid(rows: [GridItem(.flexible())], spacing: 6) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: UIScreen.main.bounds.width - 32, height: 150)
                        .setShimmerEffect(opacity: $opacity)
                }.frame(width: UIScreen.main.bounds.width - 32, height: 150)
                Spacer()
            }.frame(maxWidth: .infinity)
                .padding(.leading, 8)
        }
    }
}
#Preview {
    LoadingStateHomeView()
}
