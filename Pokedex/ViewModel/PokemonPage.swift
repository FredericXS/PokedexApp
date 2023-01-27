//
//  PokemonPage.swift
//  Pokedex
//
//  Created by Ashborn on 26/01/23.
//

import SwiftUI

struct PokemonPage: View {
    var pokemonName: String = ""
    var pokemonUrl: String = ""
    
    var body: some View {
        VStack() {
            PokemonImage(imageLink: pokemonUrl)
            Divider()
            PokemonStatus(statusLink: pokemonUrl)
        }
        Spacer()
        .navigationTitle(pokemonName.capitalized)
    }
}

struct PokemonPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PokemonPage()
        }
    }
}
