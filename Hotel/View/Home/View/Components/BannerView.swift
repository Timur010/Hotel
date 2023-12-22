//
//  BannerView.swift
//  Hotel
//
//  Created by Timur Kadiev on 21.12.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct BannerView: View {
    var image: String
    var body: some View {
        ZStack {
            WebImage(url: URL(string: image))
                .resizable()
                .frame(height: 257)
                .cornerRadius(15)
        }
    }
}

#Preview {
    BannerView(image: "Image")
}
