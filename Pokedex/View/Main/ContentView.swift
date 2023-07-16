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
        NavigationStack {
            ScrollView {
                ForEach(viewModel.filteredPokemons) { pokemon in
                    CardView(pkdataVM: PokemonDataViewModel(), name: pokemon.name, url: pokemon.url)
                        .padding(.vertical, 10)
                        .shadow(color: .gray.opacity(0.5), radius: 4, x: 0, y: 6)
                }
            }
            .onAppear { viewModel.fetchData() }
            .searchable(text: $viewModel.searchText)
            .navigationTitle("Pokédex")
            .toolbar { ToolbarView(viewModel: viewModel) }
            .sheet(isPresented: $viewModel.filterSheet) {
                FiltersView()
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            }
            .sheet(isPresented: $viewModel.sortSheet) {
                SortsView()
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            }
            .sheet(isPresented: $viewModel.generationSheet) {
                GenerationsView()
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
