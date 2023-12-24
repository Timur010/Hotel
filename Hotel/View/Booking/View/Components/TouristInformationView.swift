//
//  TouristInformation.swift
//  Hotel
//
//  Created by Timur Kadiev on 24.12.2023.
//

import SwiftUI

struct TouristInformationView: View {
    @Binding var tourist: Tourist
    @State var showDetail = false
    var title: String
    @Binding var status: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("\(title) турист ")
                    .font(.system(size: 22, weight: .medium))
                    .foregroundStyle(Color.black)
                
                Spacer()
                Button {
                    withAnimation {
                        showDetail.toggle()
                    }
                } label: {
                    Image("Arrow Left")
                        .rotationEffect(.degrees(showDetail ? 90 : -90))
                        .background(Color.lightBlueColor.cornerRadius(6))
                }
            }
            if showDetail {
                CustomTextField(text: $tourist.name, status: $status, title: "Имя", stub: "Имя")
                CustomTextField(text: $tourist.surname, status: $status, title: "Фамилия", stub: "Фамилия")
                CustomTextField(text: $tourist.dateBirth, status: $status, title: "Дата рождения", stub: "Дата рождения")
                CustomTextField(text: $tourist.citizenship, status: $status, title: "Гражданство", stub: "Гражданство")
                CustomTextField(text: $tourist.passportNumber, status: $status, title: "Номер загранпаспорта", stub: "Номер загранпаспорта")
                CustomTextField(text: $tourist.validityPeriodPassport, status: $status, title: "Срок действия загранпаспорта", stub: "Срок действия загранпаспорта")
            }
        }
        .padding()
        .background(Color.white.cornerRadius(15))
    }
}
