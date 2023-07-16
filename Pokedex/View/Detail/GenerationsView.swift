//
//  GenerationsView.swift
//  Pokedex
//
//  Created by Ashb0rn on 15/07/23.
//

import SwiftUI

struct GenerationsView: View {
    @State private var selectedGen: String? = nil
    
    private var gens = ["gen-I", "gen-II", "gen-III", "gen-IV", "gen-V", "gen-VI", "gen-VII", "gen-VIII"]
    
    var body: some View {
        VStack {
            VStack(spacing: 5) {
                Text("Generations")
                    .font(.title.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Use search for generations to explore your Pokémon!")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 25)
            
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 16),
                    GridItem(.flexible(), spacing: 16)
                ], spacing: 16) {
                    ForEach(gens, id: \.self) { gen in
                        let imageName = "\(gen)" + (selectedGen == gen ? " selected" : " nonselected")
                        Image(imageName)
                            .onTapGesture {
                                if selectedGen == gen {
                                    selectedGen = nil
                                } else {
                                    selectedGen = gen
                                }
                            }
                    }
                }
            }
        }
        .padding(.horizontal, 20)
    }
}
