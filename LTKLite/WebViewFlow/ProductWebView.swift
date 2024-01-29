//
//  ProductWebView.swift
//  LTKLite
//
//  Created by Mahbub Ahmed on 1/28/24.
//

import SwiftUI

struct ProductWebView: View {
    let url: String
    
    var body: some View {
       WebView(url: url)
    }
}
