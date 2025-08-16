//
//  ViewExtension.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 17/08/2025.
//
import SwiftUI

extension View {
    func setShimmerEffect(opacity: Binding<Double>) -> some View {
        self.modifier(ShimmerModifier(opacity: opacity))
    }
}
