//
//  QueueCardView.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 16/08/2025.
//

import SwiftUI
import Kingfisher

struct QueueCardView: View {
    var contentItem: UIContentItem = UIContentItem(id: "", title: "hello Q", subtitle: "", imageURL: "https://media.npr.org/assets/img/2018/08/03/npr_tbl_podcasttile_sq-284e5618e2b2df0f3158b076d5bc44751e78e1b6.jpg?s=1400&c=66&f=jpg", duration: 299, releaseDate: "", episodesCount: 0)
    var body: some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 10){
                KFImage(URL(string: contentItem.imageURL ?? ""))
                    .resizable()
                    .frame(width:110, height: 110)
                    .cornerRadius(12)
                
                Text("\(contentItem.title)")
                    .font(.system(size: 16, weight: .semibold))
                    .frame(width: 110, alignment: .leading)
                    .lineLimit(1)
                    .truncationMode(.tail)
                HStack(spacing: 10) {
                    Button {} label: {
                        HStack {
                            Image(systemName: "play.fill")
                                .resizable()
                                .frame(width: 10, height: 10)
                                .padding([.leading, .vertical], 8)
                                Text("\(contentItem.duration?.formattedDuration ?? "")")
                                    .font(.system(size: 12, weight: .semibold))
                                    .padding([.trailing, .vertical], 8)
                                    .multilineTextAlignment(.leading)
                        }.background {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(R.color.cardBackground))
                        }
                    }.buttonStyle(.plain)
                    if let date = contentItem.releaseDate {
                        Text("\(contentItem.releaseDate ?? "")")
                            .font(.system(size: 12, weight: .semibold))
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color.gray)
                    }
                   
                }
            }
            
        }.padding(.horizontal, 12)
    }
}
#Preview {
    QueueCardView()
}
