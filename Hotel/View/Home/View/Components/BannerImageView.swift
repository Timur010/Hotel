//
//  BannerView.swift
//  Hotel
//
//  Created by Timur Kadiev on 21.12.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct BannerImageView: View {
    var image: String
    var body: some View {
        ZStack {
            WebImage(url: URL(string: image))
                .resizable()
                .frame(height: UIScreen.main.bounds.height / 3.3)
                .cornerRadius(15)
        }
    }
}

#Preview {
    BannerImageView(image: "")
}
