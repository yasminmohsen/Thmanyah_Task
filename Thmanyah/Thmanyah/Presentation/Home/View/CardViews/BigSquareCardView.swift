//
//  BigSquareCardView.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 16/08/2025.
//

import SwiftUI
import Kingfisher

struct BigSquareCardView: View {
    var contentItem: UIContentItem = UIContentItem(id: "", title: "hello Big", subtitle: "", imageURL: "https://i.scdn.co/image/ab67616d00001e02ff9ca10b55ce82ae553c8228", duration: 10, releaseDate: "2h ago", episodesCount: 0)
    var body: some View {
        ZStack {
            HStack {
                HStack(spacing: 10) {
                    //Avatar image
                    KFImage(URL(string: contentItem.imageURL ?? ""))
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(12)
                    VStack(alignment: .leading, spacing:14) {
                        Text("\(contentItem.title)")
                            .font(.system(size: 16, weight: .semibold))
                            .multilineTextAlignment(.leading)
                        HStack(spacing: 10) {
                            Text("-\(contentItem.duration?.formattedDuration ?? "")")
                                .font(.system(size: 12, weight: .semibold))
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(Color.red)
                            
                            Text("\(contentItem.releaseDate ?? "")")
                                .font(.system(size: 12, weight: .semibold))
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(Color.gray)
                        }
                    }
                }.padding(.all)
                Spacer()
                VStack(alignment: .trailing) {
                    Spacer()
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .bottomTrailing)
                        .padding(.trailing, 24)
                }.frame(width: 30, height: 100)
            }.background {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(R.color.cardBackground))
            }
        }.padding(.horizontal, 12)
      
    }
}

#Preview {
    BigSquareCardView()
}
