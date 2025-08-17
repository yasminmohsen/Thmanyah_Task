//
//  TwoLinesGridCardView.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 16/08/2025.
//

import SwiftUI
import Kingfisher

struct TwoLinesGridCardView: View {
    var contentItem: UIContentItem
    var body: some View {
        ZStack(alignment: .leading) {
            HStack(spacing: 10) {
                //Avatar Image
                KFImage(URL(string: contentItem.imageURL ?? ""))
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(12)
                //Date + Title Box + DurationButton
                VStack(alignment: .leading, spacing: 0) {
                    Text("\(contentItem.releaseDate ?? "")")
                        .font(.system(size: 12, weight: .semibold))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(Color.gray)
                        .padding(.bottom,4)
                    
                    Text("\(contentItem.title)")
                        .font(.system(size: 12, weight: .semibold))
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .frame(maxWidth: 200, alignment: .leading)
                        .padding(.bottom,10)
                    
                    //DurationButton
                    DurationButtonView(duration: contentItem.duration?.formattedDuration ?? "")
                }
                Spacer()
            }
        }
    }
}

#Preview {
    TwoLinesGridCardView(contentItem: UIContentItem(id: "", title: "hello two lines", subtitle: "", imageURL: "https://media.npr.org/assets/img/2023/03/01/npr-news-now_square.png?s=1400&c=66", duration: 2790, releaseDate: "2h ago", episodesCount: 0))
}
