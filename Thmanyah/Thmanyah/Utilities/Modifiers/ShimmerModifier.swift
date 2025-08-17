//
//  ShimmerModifier.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 17/08/2025.
//

import SwiftUI

struct ShimmerModifier: ViewModifier {
    @Binding var opacity: Double
    
    func body(content: Content) -> some View {
        content
            .opacity(opacity)
            .transition(.opacity)
            .onAppear {
                let baseAnimation = Animation.easeInOut(duration: 1)
                let repeated = baseAnimation.repeatForever(autoreverses: true)
                withAnimation(repeated) {
                    $opacity.wrappedValue = 1
                }
            }
    }
}
