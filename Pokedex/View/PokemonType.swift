//
//  PokemonStatus.swift
//  Pokedex
//
//  Created by Ashborn on 26/01/23.
//

import SwiftUI

struct PokemonType: View {
    var typesLink = ""
    @State private var pokemonType = ""
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    func getType(url: String) {
        var tempType: String?
        PokemonSelectedApi().getTypes(url: url) { type in
            tempType = type.types[0].name
            self.pokemonType = tempType ?? "normal"
        }
        
    }
}

struct PokemonType_Previews: PreviewProvider {
    static var previews: some View {
        PokemonType()
    }
}
