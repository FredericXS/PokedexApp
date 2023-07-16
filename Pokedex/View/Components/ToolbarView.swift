//
//  ToolbarView.swift
//  Pokedex
//
//  Created by Ashb0rn on 14/07/23.
//

import SwiftUI

struct ToolbarView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel: PokemonViewModel
    
    var body: some View {
        HStack {
            Button {
                viewModel.generationSheet = true
            } label: {
                Image("Generation")
                    .colorInvertIfNeeded(scheme: colorScheme)
            }
            
            Button {
                viewModel.sortSheet = true
            } label: {
                Image("Sort")
                    .colorInvertIfNeeded(scheme: colorScheme)
            }
            
            Button {
                viewModel.filterSheet = true
            } label: {
                Image("Filter")
                    .colorInvertIfNeeded(scheme: colorScheme)
            }
        }
        .padding(.trailing, 20)
    }
}
