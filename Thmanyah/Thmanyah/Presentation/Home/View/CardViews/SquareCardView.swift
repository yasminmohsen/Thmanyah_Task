//
//  SquareCardView.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 16/08/2025.
//

import SwiftUI
import Kingfisher

struct SquareCardView: View {
    var contentItem: UIContentItem = UIContentItem(id: "", title: "hello square", subtitle: "", imageURL: "https://bookbrush.com/wp-content/uploads/BookBrushImage-2021-5-11-20-5227-1024x1024.jpg", duration: 10, releaseDate: "", episodesCount: 20)
    var body: some View {
        ZStack(alignment:.bottomLeading) {
            KFImage(URL(string: contentItem.imageURL ?? ""))
                .resizable()
                 .frame(width:270, height: 180)
                 .cornerRadius(20)
                 .overlay {
                     RoundedRectangle(cornerRadius: 20)
                         .fill(.black.opacity(0.5))
                 }
                
            VStack(alignment: .leading,spacing: 6) {
                Text("\(contentItem.title)")
                    .font(.system(size: 16, weight: .semibold))
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.white)
                if let episodesCount = contentItem.episodesCount {
                    Text("\(episodesCount) episodes")
                        .font(.system(size: 12, weight: .regular))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.white)
                }
            }.padding(.all, 12)
        }.padding(.horizontal, 12)
    }
}

#Preview {
    SquareCardView()
}
