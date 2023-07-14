//
//  ToolbarView.swift
//  Pokedex
//
//  Created by Ashb0rn on 14/07/23.
//

import SwiftUI

struct ToolbarView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack {
            Button {
                // Show different generations
            } label: {
                Image("Generation")
                    .colorInvertIfNeeded(scheme: colorScheme)
            }
            
            Button {
                // Sort by
            } label: {
                Image("Sort")
                    .colorInvertIfNeeded(scheme: colorScheme)
            }
            
            Button {
                // Filter by
            } label: {
                Image("Filter")
                    .colorInvertIfNeeded(scheme: colorScheme)
            }
        }
        .padding(.trailing, 20)
    }
}
