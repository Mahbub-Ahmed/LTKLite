//
//  DetailsView.swift
//  LTKLite
//
//  Created by Mahbub Ahmed on 1/28/24.
//

import SwiftUI

struct DetailsView: View {
    let viewModel: DetailsViewModel
    
    var body: some View {
        GeometryReader { proxy in
            NavigationStack {
                ScrollView {
                    VStack {
                        if let uiImage = viewModel.images[viewModel.heroImageURL] {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: proxy.size.width, height: 450)
                        } else {
                            ProgressView()
                                .frame(height: 300)
                        }
                        if let uiImage = viewModel.images[viewModel.profileImageUrl] {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                        } else {
                            ProgressView()
                                .frame(height: 100)
                        }
                        Text(viewModel.displayName)
                            .padding()
                        
                        Divider()
                            .foregroundColor(.gray)
                            .padding(.bottom, 10)
                        
                        ProductView(viewModel: viewModel)
                    }
                }
            }
            .task {
                viewModel.loadImages()
            }
        }
    }
}
