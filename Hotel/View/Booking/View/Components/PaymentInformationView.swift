//
//  PaymentInformationView.swift
//  Hotel
//
//  Created by Timur Kadiev on 24.12.2023.
//

import SwiftUI

struct PaymentInformationView: View {
    var title: String
    var value: Int
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 16, weight: .regular))
                .foregroundStyle(Color.lightGrayColor)
            Spacer()
            Text("\(value) ₽")
                .font(.system(size: 16, weight: .regular))
                .foregroundStyle(Color.black)
        }
    }
}
