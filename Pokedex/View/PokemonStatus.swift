//
//  PokemonStatus.swift
//  Pokedex
//
//  Created by Ashborn on 26/01/23.
//

import SwiftUI

struct PokemonStatus: View {
    var statusLink = ""
    @State private var pokemonExperience = 0
    @State private var pokemonWeight = "0.0"
    @State private var pokemonHeight = "0.0"
    @State private var pokemonId = "001"
    @State private var pokemonTypes = [PokemonTypes]()
    @State private var pokemonAbilities = [PokemonAbilities]()
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack {
                ForEach(pokemonTypes) { type in
                    HStack {
                        Spacer()
                        Text("Type: ")
                        Text("\(type.type.name)".capitalized)
                            .foregroundColor(Color(type.type.name))
                        Spacer()
                    }
                }
            }
            HStack {
                ForEach(pokemonAbilities) { ability in
                    HStack {
                        Spacer()
                        Text("Ability: ")
                        Text("\(ability.ability.name)".capitalized)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                }
            }
            Text("Pokedex Data")
                .bold()
                .font(.system(size: 22))
                .padding(.vertical, 10)
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Index")
                    Spacer()
                        .frame(width: 113)
                    Text("\(pokemonId)")
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("Height")
                    Spacer()
                        .frame(width: 103)
                    Text("\(pokemonHeight)m")
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("Weight")
                    Spacer()
                        .frame(width: 100)
                    Text("\(pokemonWeight)kg")
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("Base Exp")
                    Spacer()
                        .frame(width: 90)
                    Text("\(pokemonExperience)")
                        .foregroundColor(.gray)
                }
            }
        }
            .onAppear {
                getPokemonExperience(url: statusLink)
                getPokemonId(url: statusLink)
                getPokemonWeight(url: statusLink)
                getPokemonHeight(url: statusLink)
                getPokemonTypes(url: statusLink)
                getPokemonAbilities(url: statusLink)
            }
    }
    
    func getPokemonTypes(url: String) {
        PokemonSelectedApi().getTypes(url: url) { pktype in
            self.pokemonTypes = pktype
        }
    }
    
    func getPokemonAbilities(url: String) {
        PokemonSelectedApi().getAbilities(url: url) { pkability in
            self.pokemonAbilities = pkability
        }
    }
    
    func getPokemonExperience(url: String) {
        PokemonSelectedApi().getBaseExperience(url: url) { exp in
            self.pokemonExperience = exp
        }
    }
    
    func getPokemonId(url: String) {
        PokemonSelectedApi().getId(url: url) { id in
            formatId(id: id)
        }
    }
    
    func formatId(id: Int) {
        if id < 10 {
            self.pokemonId = String("00\(id)")
        } else if id < 10 && id > 100 {
            self.pokemonId = String("0\(id)")
        } else {
            self.pokemonId = String(id)
        }
    }
    
    func getPokemonWeight(url: String) {
        PokemonSelectedApi().getWeight(url: url) { weight in
            self.pokemonWeight = String(format: "%.1f", (weight / 10))
        }
    }
    
    func getPokemonHeight(url: String) {
        PokemonSelectedApi().getHeight(url: url) { height in
            self.pokemonHeight = String(format: "%.1f", (height / 10))
        }
    }
}

struct PokemonStatus_Previews: PreviewProvider {
    static var previews: some View {
        PokemonStatus()
    }
}
