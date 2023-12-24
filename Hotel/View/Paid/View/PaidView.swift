//
//  PaidView.swift
//  Hotel
//
//  Created by Timur Kadiev on 24.12.2023.
//

import SwiftUI

struct PaidView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var coordinator: Coordinator
    var body: some View {
        VStack(spacing: 4) {
            Spacer()
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(Color.imageBackgraundColor)
                    
                Image("PainImage")
                    .resizable()
                    .frame(width: 44, height: 44)
            }
            
            Text("Ваш заказ принят в работу")
                .font(.system(size: 22, weight: .semibold))
            
            Text("Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
                .foregroundStyle(Color.lightGrayColor)
                .font(.system(size: 16, weight: .regular))
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            Divider()
            CustomButtonView(title: "Супер") {
                coordinator.popToRoot()
            }
            .padding(.bottom, -28)
        }
        .frame(width: UIScreen.main.bounds.width)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image("Arrow Left")
        })
    }
}

#Preview {
    PaidView()
}
