//
//  DurationButtonView.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 17/08/2025.
//

import SwiftUI

struct DurationButtonView: View {
    //MARK: - State
    @State var duration: String
    
    //MARK: - Body
    var body: some View {
        ZStack {
            Button {} label: {
                HStack {
                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .padding([.leading, .vertical], 8)
                    
                    Text("\(duration)")
                        .font(.system(size: 12, weight: .semibold))
                        .padding([.trailing, .vertical], 8)
                        .multilineTextAlignment(.leading)
                }.background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(R.color.cardBackground))
                }
            }.buttonStyle(.plain)
        }
    }
}

#Preview {
    DurationButtonView(duration:"")
}
