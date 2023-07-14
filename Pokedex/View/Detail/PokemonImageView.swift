//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Ashborn on 26/01/23.
//

import SwiftUI

struct PokemonImageView: View {
    @State private var pokemonSprite = ""
    
    var imageLink = ""
    
    var body: some View {
        AsyncImage(url: URL(string: pokemonSprite)) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {}
            .onAppear {
                let loadedData = UserDefaults.standard.string(forKey: imageLink)
                
                if loadedData == nil {
                    getSprite(url: imageLink)
                    UserDefaults.standard.set(imageLink, forKey: imageLink)
                } else {
                    getSprite(url: loadedData!)
                }
            }
            .foregroundColor(.gray.opacity(0.6))
    }
    
    // Can't implement in PokemonDataViewModel because you'll got network error
    func getSprite(url: String) {
        var tempSprite: String?
        PokemonDetails().getSprite(url: url) { sprite in
            tempSprite = sprite.other.officialArtwork.front_default
            self.pokemonSprite = tempSprite ?? "placeholder"
        }
    }
}
