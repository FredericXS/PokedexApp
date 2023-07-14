//
//  Images.swift
//  Pokedex
//
//  Created by Ashb0rn on 14/07/23.
//

import SwiftUI

extension Image {
    func colorInvertIfNeeded(scheme: ColorScheme) -> some View {
        if scheme == .dark {
            return AnyView(self.colorInvert())
        } else {
            return AnyView(self)
        }
    }
}
