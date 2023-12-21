//
//  SwitchDetailedView.swift
//  Hotel
//
//  Created by Timur Kadiev on 21.12.2023.
//

import SwiftUI

struct SwitchDetailedView: View {
    var image: String
    var title: String
    var text: String
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .frame(width: 24, height: 24)
            VStack (alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(Color.lightBlackColor)
                Text(text)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(Color.lightGrayColor)
            }
            Spacer()
            Image("Arrow Right")
                .foregroundStyle(Color.lightBlackColor)
        }
    }
}

#Preview {
    SwitchDetailedView(image: "Close-square", title: "Удобства", text: "Самое необходимое")
}
