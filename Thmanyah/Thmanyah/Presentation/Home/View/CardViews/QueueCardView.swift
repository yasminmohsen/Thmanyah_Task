//
//  QueueCardView.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 16/08/2025.
//

import SwiftUI

struct QueueCardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                 .fill(.gray)
                 .frame(width:120, height: 120)
                 .frame(maxWidth: .infinity)
                 .padding(.all, 16)
                 .overlay {
                     Text("Queue")
                 }
        }

    }
}

#Preview {
    QueueCardView()
}
