//
//  BannerView.swift
//  Hotel
//
//  Created by Timur Kadiev on 22.12.2023.
//

import SwiftUI

struct BannerView: View {
    var baner: [String?]
    @State var selectedBanner = 0
    var body: some View {
        ZStack (alignment: .bottom) {
            TabView(selection: $selectedBanner.animation()) {
                ForEach(0..<baner.count, id: \.self)  { image in
                    BannerImageView(image: baner[image] ?? "")
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: UIScreen.main.bounds.height / 3.3)
            
            HStack {
                ForEach(baner.indices, id: \.self) { index in
                    Circle()
                        .fill(selectedBanner == index ? Color.black : Color.gray.opacity(1 - Double(abs(selectedBanner - index)) / Double(baner.count)))
                        .frame(width: 7, height: 7)
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color.white.cornerRadius(5))
            .padding(.bottom, 8)
        }
    }
}

#Preview {
    BannerView(baner: [])
}
