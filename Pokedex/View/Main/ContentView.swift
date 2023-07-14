//
//  ContentView.swift
//  Pokedex
//
//  Created by Ashborn on 25/01/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.filteredPokemons) { entry in
                    CardView(name: entry.name, url: entry.url)
                        .padding(.vertical, 10)
                        .shadow(color: .gray.opacity(0.3), radius: 4, x: 0, y: 6)
                }
            }
            .onAppear { viewModel.fetchData() }
            .searchable(text: $viewModel.searchText)
            .navigationTitle("Pokédex")
            .navigationViewStyle(.stack)
            .toolbar {
                ToolbarView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
