//
//  SquareCardView.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 16/08/2025.
//

import SwiftUI

struct SquareCardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                 .fill(.gray)
                 .frame(width:270, height: 180)
                 .frame(maxWidth: .infinity)
                 .padding(.all, 16)
                 .overlay {
                     Text("Square")
                 }
        }
    }
}

#Preview {
    SquareCardView()
}
