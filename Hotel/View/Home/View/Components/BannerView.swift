//
//  BannerView.swift
//  Hotel
//
//  Created by Timur Kadiev on 21.12.2023.
//

import SwiftUI

struct BannerView: View {
    var image: String
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .frame(height: 257)
        }
    }
}

#Preview {
    BannerView(image: "Image")
}
