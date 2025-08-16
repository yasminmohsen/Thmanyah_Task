//
//  TwoLinesGridCardView.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 16/08/2025.
//

import SwiftUI

struct TwoLinesGridCardView: View {
    var contentItem: UIContentItem = UIContentItem(id: "", title: "hello two lines", subtitle: "", imageURL: "", duration: 0, releaseDate: "", episodesCount: 0)
    var body: some View {
        ZStack {
            HStack {
                RoundedRectangle(cornerRadius: 20)
                     .fill(.gray)
                     .frame(width:100, height: 100)
                     .padding(.all, 16)
                     .overlay {
                         Text("Queue")
                     }
                VStack {
                    Text("Time")
                    Text("\(contentItem.title)")
                   RoundedRectangle(cornerRadius: 20)
                        .frame(width: 70, height: 30)
                }
              
                Spacer()
               
            }
         
        }

    }
}

#Preview {
    TwoLinesGridCardView()
}
