//
//  FeedView.swift
//  LTKLite
//
//  Created by Mahbub Ahmed on 1/28/24.
//

import SwiftUI

struct FeedView: View {
    let viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack {
            switch viewModel.viewState {
            case .loading:
                ProgressView()
            case .loaded:
                FeeedGridView(viewModel: viewModel)
            case .failure:
                VStack {
                    Text("Unable to load feed")
                    Image(systemName: "exclamationmark.square")
                }
            }
        }
        .task {
            viewModel.loadFeed()
        }
    }
}

