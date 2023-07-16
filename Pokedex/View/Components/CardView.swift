//
//  CardView.swift
//  Pokedex
//
//  Created by Ashb0rn on 13/07/23.
//

import SwiftUI

struct CardView: View {
    @StateObject var pkdataVM: PokemonDataViewModel
    var name: String
    var url: String
    
    var body: some View {
        HStack {
            VStack(spacing: 5) {
                Text("#\(pkdataVM.pkId)")
                    .foregroundColor(Color("NumberText"))
                    .font(.subheadline.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(name.capitalized)
                    .foregroundColor(.white)
                    .font(.title.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    ForEach(pkdataVM.pkTypes) { pktype in
                        Image(pktype.type.name.capitalized)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 15)
        }
        .padding(.horizontal, 40)
        .padding(.vertical, 5)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color(0 < pkdataVM.pkTypes.count ? pkdataVM.pkTypes[0].type.name : "normal"))
                .padding(.horizontal, 25)
                .overlay(
                    ZStack {
                        Image("Pattern")
                            .scaleEffect(1.2)
                            .padding(.trailing, 90)
                            .padding(.bottom, 75)
                        Image("Pokeball")
                            .resizable()
                            .padding(.trailing, 25)
                            .scaledToFit()
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        PokemonImageView(imageLink: url)
                            .scaleEffect(1.4)
                            .padding(.trailing, 60)
                            .padding(.bottom, 30)
                            .frame(maxWidth: .infinity, alignment: .topTrailing)
                    }
                )
        }
        .onAppear {
            pkdataVM.fetchPokemonDetails(url: url)
        }
    }
}
