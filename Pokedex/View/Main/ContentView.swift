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
                }
            }
            .onAppear { viewModel.fetchData() }
            .searchable(text: $viewModel.searchText)
            .navigationTitle("Pokédex")
            .navigationViewStyle(.stack)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        // Ação do primeiro botão
                    } label: {
                        Image("Generation")
                    }
                    
                    Button {
                        // Ação do segundo botão
                    } label: {
                        Image("Sort")
                    }
                    
                    Button {
                        // Ação do terceiro botão
                    } label: {
                        Image("Filter")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
