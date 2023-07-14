//
//  CardView.swift
//  Pokedex
//
//  Created by Ashb0rn on 13/07/23.
//

import SwiftUI

struct CardView: View {
    @State private var pkid = "001"
    @State private var pktypes = [PokemonTypes]()
    var name: String
    var url: String
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text("#\(pkid)")
                        .foregroundColor(Color(named: "NumberText"))
                        .font(.subheadline.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image("Pattern")
                        .padding(.trailing, 150)
                        .scaleEffect(1.2)
                }
                Text(name.capitalized)
                    .foregroundColor(.white)
                    .font(.title.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    ForEach(pktypes) { pktype in
                        Image(pktype.type.name.capitalized)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 30)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color(named: 0 < pktypes.count ? pktypes[0].type.name : "normal"))
                .padding(.horizontal, 20)
                .overlay(
                    ZStack {
                        Image("Pokeball")
                            .resizable()
                            .padding(.horizontal, 10)
                            .scaledToFit()
                            .scaleEffect(0.85)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        PokemonImageView(imageLink: url)
                            .padding(.horizontal, 20)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                )
        }
        .onAppear {
            getId(url: url)
            getTypes(url: url)
        }
    }
    
    func getId(url: String) {
        PokemonDetails().getId(url: url) { id in
            if id < 10 {
                self.pkid = String("00\(id)")
            } else if id > 10 && id < 100 {
                self.pkid = String("0\(id)")
            } else {
                self.pkid = String(id)
            }
        }
    }
    
    func getTypes(url: String) {
        PokemonDetails().getTypes(url: url) { pktype in
            self.pktypes = pktype
        }
    }
}
