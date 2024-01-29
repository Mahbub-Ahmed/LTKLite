//
//  ProductView.swift
//  LTKLite
//
//  Created by Mahbub Ahmed on 1/29/24.
//

import SwiftUI


struct ProductView: View {
    let viewModel: DetailsViewModel
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
            ForEach(viewModel.products) { product in
                NavigationLink {
                    EmptyView()
                } label: {
                    if let uiImage = viewModel.images[product.imageUrl] {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 150, minHeight: 200)
                        Divider()
                            .foregroundColor(.gray)
                    } else {
                        ProgressView()
                            .frame(height: 200)
                    }
                }
            }
        }
    }
}
