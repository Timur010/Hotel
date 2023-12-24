//
//  RoomView.swift
//  Hotel
//
//  Created by Timur Kadiev on 22.12.2023.
//

import SwiftUI

struct RoomView: View {
    var roomData: Room
    var action: () -> ()
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            BannerView(baner: roomData.imageUrls)
            
            Text(roomData.name ?? "")
                .font(.system(size: 22, weight: .medium))
            
            CategoriesView(categories: roomData.peculiarities)
            
            Button {
            } label: {
                HStack (spacing: 0) {
                    Text("Подробнее о номере")
                        .font(.system(size: 16, weight: .medium))
                    Image("Arrow Right")
                        .foregroundStyle(Color.blue)
                }
                .padding(.leading, 10)
                .padding(.vertical, 5)
                .background(Color.lightBlueColor.cornerRadius(5))
            }
            HStack(alignment: .bottom) {
                Text("\(roomData.price ?? 0) ₽")
                    .font(.system(size: 30, weight: .semibold))
                Text(roomData.pricePer ?? "")
                    .font(.system(size: 16, weight: .regular))
                    .baselineOffset((16) / 4)
            }
            CustomButtonView(title: "Выбрать номер", action: action)
                .padding(.bottom, -28)
        }
        .padding()
        .background(Color.white.cornerRadius(12))
        
    }
}

#Preview {
    RoomView(roomData: Room.mockRoom, action: ({}))
}
