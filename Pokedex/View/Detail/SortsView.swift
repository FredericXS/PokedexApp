//
//  SortsView.swift
//  Pokedex
//
//  Created by Ashb0rn on 15/07/23.
//

import SwiftUI

struct SortsView: View {
    @State private var selectedSort: String = "Smallest number first"
    
    var body: some View {
        VStack {
            VStack(spacing: 5) {
                Text("Sort")
                    .font(.title.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Sort Pokémons alphabetically or by National Pokédex number!")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 25)
            
            VStack {
                SortsButtonView(selectedButton: $selectedSort, buttonName: "Smallest number first")
                SortsButtonView(selectedButton: $selectedSort, buttonName: "Highest number first")
                SortsButtonView(selectedButton: $selectedSort, buttonName: "A-Z")
                SortsButtonView(selectedButton: $selectedSort, buttonName: "Z-A")
            }
        }
        .padding(.horizontal, 20)
    }
}
