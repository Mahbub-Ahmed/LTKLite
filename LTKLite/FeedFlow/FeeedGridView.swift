//
//  FeeedGridView.swift
//  LTKLite
//
//  Created by Mahbub Ahmed on 1/28/24.
//

import SwiftUI

struct FeeedGridView: View {
    let viewModel: FeedViewModel
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible())]) {
                    ForEach(viewModel.ltks) { ltk in
                        NavigationLink {
                            EmptyView()
                        } label: {
                            if let image = viewModel.images[ltk.imageUrl] {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: proxy.size.width, height: 450)
                                    .cornerRadius(15)
                            } else {
                                ProgressView()
                                    .frame(height:450)
                            }
                        }
                        .padding(15)
                        .task {
                            if ltk.id == viewModel.lastFeedId {
                                viewModel.loadFeed()
                            }
                        }
                    }
                }
            }
        }
    }
}

