//
//  BookingDetailsView.swift
//  Hotel
//
//  Created by Timur Kadiev on 23.12.2023.
//

import SwiftUI

struct BookingDetailsView: View {
    var title: String
    var text: String
    var body: some View {
        HStack (alignment: .top) {
            Group {
                Text(title)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(Color.lightGrayColor)
                Text(text)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(Color.black)
                
            }
            .frame(maxWidth: ((UIScreen.main.bounds.width / 2) - 32) , alignment: .leading)
        }
    }
}

#Preview {
    BookingDetailsView(title: "Вылет из", text: "Санкт-Петербург")
}
