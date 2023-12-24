//
//  CustomButtonView.swift
//  Hotel
//
//  Created by Timur Kadiev on 24.12.2023.
//

import SwiftUI

struct CustomButtonView: View {
    var title: String
    var action: () -> ()
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(Color.white)
                .frame(width: UIScreen.main.bounds.width - 32)
                .padding(.vertical, 15)
                .background(Color.blue.cornerRadius(15))
                .padding(.top, 12)
                .padding(.bottom, 28)
        }
    }
}

#Preview {
    CustomButtonView(title: "", action: ({}))
}
