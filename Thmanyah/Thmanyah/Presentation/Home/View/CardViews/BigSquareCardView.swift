//
//  BigSquareCardView.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 16/08/2025.
//

import SwiftUI


struct BigSquareCardView: View {
    var contentItem: UIContentItem = UIContentItem(id: "", title: "hello Big", subtitle: "", imageURL: "", duration: 0, releaseDate: "", episodesCount: 0)
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                 .fill(.gray)
                 .frame(height: 150)
                 .frame(maxWidth: .infinity)
                 .padding(.all, 16)
                 .overlay {
                     Text("\(contentItem.title)")
                 }
        }
      
    }
}

#Preview {
    BigSquareCardView()
}
