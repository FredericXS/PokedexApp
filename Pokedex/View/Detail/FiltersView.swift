//
//  FiltersView.swift
//  Pokedex
//
//  Created by Ashb0rn on 15/07/23.
//

import SwiftUI

struct FiltersView: View {

    let pktypes = ["Bug", "Dark", "Dragon", "Electric", "Fairy", "Fighting", "Fire", "Flying", "Ghost", "Grass", "Ground", "Ice", "Normal", "Poison", "Psychic", "Rock", "Steel", "Water"]
    let heights = ["Short", "Medium", "Tall"]
    let weights = ["Light", "NormalWeight", "Heavy"]
    
    var body: some View {
        VStack {
            VStack(spacing: 5) {
                Text("Filters")
                    .font(.title.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Use advanced search to explore Pokémon by type, weakness, height and more!")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 25)
            
            ScrollView {
                FiltersVerticalView(text: "Types", view: FiltersScrollView(items: pktypes))
                
                FiltersVerticalView(text: "Weaknesses", view: FiltersScrollView(items: pktypes))
                
                FiltersVerticalView(text: "Heights", view: FiltersScrollView(items: heights))
                
                FiltersVerticalView(text: "Weights", view: FiltersScrollView(items: weights))
                
                FiltersVerticalView(text: "Number Range", view: RangeSliderView())
                
                HStack {
                    Button {
                        // Soon
                    } label: {
                        Text("Reset")
                            .foregroundColor(.gray)
                            .padding(20)
                            .padding(.horizontal, 30)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color("DefaultInput"))
                            }
                    }
                    
                    Button {
                        // Soon
                    } label: {
                        Text("Apply")
                            .foregroundColor(.white)
                            .padding(20)
                            .padding(.horizontal, 30)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color("RedButton"))
                            }
                    }
                }
                .padding(.top, 25)
                .padding(.horizontal, 20)
            }
        }
        .padding(.horizontal, 20)
    }
}
