//
//  BigSquareCardView.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 16/08/2025.
//

import SwiftUI


struct BigSquareCardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                 .fill(.gray)
                 .frame(height: 150)
                 .frame(maxWidth: .infinity)
                 .padding(.all, 16)
                 .overlay {
                     Text("Big square")
                 }
        }
      
    }
}

#Preview {
    BigSquareCardView()
}
