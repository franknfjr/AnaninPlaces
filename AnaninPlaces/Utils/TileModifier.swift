//
//  TileModifier.swift
//  AnaninPlaces
//
//  Created by Frank on 23/04/21.
//

import SwiftUI

extension View {
    func asTitle() -> some View {
        modifier(TiteModifier())
    }
}

struct TiteModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.white)
            .cornerRadius(5)
            .shadow(color: .init(.sRGB, white: 0.8, opacity: 1), radius: 4, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 2 )
        
    }
}
