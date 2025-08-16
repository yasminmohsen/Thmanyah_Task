//
//  QueueCardView.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 16/08/2025.
//

import SwiftUI

struct QueueCardView: View {
    var contentItem: UIContentItem = UIContentItem(id: "", title: "hello Q", subtitle: "", imageURL: "", duration: 10, releaseDate: "", episodesCount: 0)
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                 .fill(.gray)
                 .frame(width:120, height: 120)
                 .frame(maxWidth: .infinity)
                 .padding(.all, 16)
                 .overlay {
                     Text("\(contentItem.title)")
                 }
        }

    }
}

#Preview {
    QueueCardView()
}
