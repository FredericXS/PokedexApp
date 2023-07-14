//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Ashb0rn on 13/07/23.
//

import Foundation

class PokemonViewModel: ObservableObject {
    @Published var pokemons = [PokemonEntry]()
    @Published var searchText = ""
    
    var filteredPokemons: [PokemonEntry] {
        if searchText.isEmpty {
            return pokemons
        } else {
            return pokemons.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    func fetchData() {
        PokeApi().getData { pokemon in
            DispatchQueue.main.async {
                self.pokemons = pokemon
            }
        }
    }
}
