//
//  RangeSliderView.swift
//  Pokedex
//
//  Created by Ashb0rn on 15/07/23.
//

import SwiftUI

struct RangeSliderView: View {
    @State private var width: CGFloat = 15
    @State private var width2: CGFloat = 35
    private var maxWidth: CGFloat = 151 // Max Pokémon ids
    
    var body: some View {
        VStack {
            VStack {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: .infinity)
                        .fill(.black.opacity(0.2))
                        .frame(height: 4)
                    RoundedRectangle(cornerRadius: .infinity)
                        .fill(Color("RedButton"))
                        .frame(width: self.width2 - self.width, height: 4)
                        .offset(x: self.width + 18)
                    
                    HStack(spacing: 0) {
                        Circle()
                            .stroke(Color("RedButton"), lineWidth: 4)
                            .background(Circle().fill(Color.white))
                            .frame(width: 18, height: 18)
                            .offset(x: self.width)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        if value.location.x >= 1 && value.location.x <= self.width2 {
                                            self.width = value.location.x
                                        }
                                    }
                            )
                        
                        Circle()
                            .stroke(Color("RedButton"), lineWidth: 4)
                            .background(Circle().fill(Color.white))
                            .frame(width: 18, height: 18)
                            .offset(x: self.width2)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        if value.location.x <= self.maxWidth && value.location.x >= self.width {
                                            self.width2 = value.location.x
                                        }
                                    }
                            )
                    }
                }
            }
            .padding(.horizontal, 10)
            
            HStack(spacing: 0) {
                Text("\(Int(width))")
                    .foregroundColor(.gray)
                    .offset(x: width + 9, y: 5)
                
                Text("\(Int(width2))")
                    .foregroundColor(.gray)
                    .offset(x: width2 + 9, y: 5)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.top, 10)
    }
}
