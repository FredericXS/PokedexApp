//
//  FiltersVerticalVie.swift
//  Pokedex
//
//  Created by Ashb0rn on 15/07/23.
//

import SwiftUI

struct FiltersVerticalView: View {
    var text: String
    var view: any View
    
    var body: some View {
        VStack(spacing: 5) {
            Text(text)
                .font(.headline.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
            AnyView(view)
        }
    }
}

