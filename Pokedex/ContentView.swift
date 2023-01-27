//
//  ContentView.swift
//  Pokedex
//
//  Created by Ashborn on 25/01/23.
//

import SwiftUI

struct ContentView: View {
    @State var pokemon = [PokemonEntry]()
    @State var searchText = ""
    @State var pokeId = 0
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchText == "" ? pokemon : pokemon.filter({
                    $0.name.contains(searchText.lowercased())
                })) { entry in
                    HStack {
                        PokemonImage(imageLink: entry.url)
                            .padding(.trailing, 20)
                        NavigationLink("\(entry.name)".capitalized, destination: PokemonPage(pokemonName: entry.name, pokemonUrl: entry.url))
                    }
                }
            }
            .onAppear {
                PokeApi().getData() { pokemon in
                    self.pokemon = pokemon
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Pokedex")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
