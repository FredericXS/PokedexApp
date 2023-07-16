//
//  FiltersScrollView.swift
//  Pokedex
//
//  Created by Ashb0rn on 15/07/23.
//

import SwiftUI
import Introspect

struct FiltersScrollView: View {
    @State private var selectedItems: Set<String> = []
    var items: [String]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 0) {
                ForEach(items, id: \.self) { imageName in
                    Image("\(imageName)\(selectedItems.contains(imageName) ? " selected" : " nonselected")")
                        .resizable()
                        .scaledToFit()
                        .onTapGesture {
                            if selectedItems.contains(imageName) {
                                selectedItems.remove(imageName)
                            } else {
                                selectedItems.insert(imageName)
                            }
                        }
                }
            }
            .frame(height: 70)
        }
        .introspectScrollView { scrollView in
            scrollView.showsHorizontalScrollIndicator = false
        }
    }
}

