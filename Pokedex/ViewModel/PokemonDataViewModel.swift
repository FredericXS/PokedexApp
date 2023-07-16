//
//  PokemonDataViewModel.swift
//  Pokedex
//
//  Created by Ashb0rn on 14/07/23.
//

import SwiftUI

class PokemonDataViewModel: ObservableObject {
    @Published var pkId = "001"
    @Published var pkTypes = [PokemonTypes]()
    @Published var selectedItem: String? = ""
    
    func fetchPokemonDetails(url: String) {
        getId(url: url)
        getTypes(url: url)
    }
    
    private func getId(url: String) {
        PokemonDetails().getId(url: url) { id in
            if id < 10 {
                self.pkId = String("00\(id)")
            } else if id < 100 {
                self.pkId = String("0\(id)")
            } else {
                self.pkId = String(id)
            }
        }
    }
    
    private func getTypes(url: String) {
        PokemonDetails().getTypes(url: url) { pktype in
            self.pkTypes = pktype
        }
    }
}
