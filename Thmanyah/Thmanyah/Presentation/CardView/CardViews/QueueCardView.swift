//
//  QueueCardView.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 16/08/2025.
//

import SwiftUI
import Kingfisher

struct QueueCardView: View {
    var contentItem: UIContentItem
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 10) {
                // Avatar Image
                KFImage(URL(string: contentItem.imageURL ?? ""))
                    .resizable()
                    .frame(width:110, height: 110)
                    .cornerRadius(12)
                // Title Text
                Text("\(contentItem.title)")
                    .font(.system(size: 12, weight: .semibold))
                    .frame(width: 110, alignment: .leading)
                    .lineLimit(1)
                    .truncationMode(.tail)
                //Duration Button
                HStack(spacing: 10) {
                    DurationButtonView(duration: contentItem.duration?.formattedDuration ?? "")
                    if let date = contentItem.releaseDate {
                        Text("\(date)")
                            .font(.system(size: 12, weight: .semibold))
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color.gray)
                    }
                }
            }
        }
    }
}
#Preview {
    QueueCardView(contentItem: UIContentItem(id: "", title: "hello Q", subtitle: "", imageURL: "https://media.npr.org/assets/img/2018/08/03/npr_tbl_podcasttile_sq-284e5618e2b2df0f3158b076d5bc44751e78e1b6.jpg?s=1400&c=66&f=jpg", duration: 299, releaseDate: "", episodesCount: 0))
}
