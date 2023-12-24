//
//  CustomPhoneTextField.swift
//  Hotel
//
//  Created by Timur Kadiev on 24.12.2023.
//

import SwiftUI

struct PhoneNumberView: View {
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Номер телефона")
                .font(.system(size: 12))
                .foregroundStyle(Color.lightGrayColor)
                .padding(.top, 10)
            HStack {
                Text("+7")
                    .font(.system(size: 16))
                    .foregroundStyle(Color.black)
                    
                CustomPhoneTestField()
                    .autocapitalization(.none)
                    .focused($isFocused)
            }
            .padding(.bottom, 10)
        }
        .padding(.leading, 16)
        .background(Color.textFieldColor)
        .cornerRadius(10)
    }
}

#Preview {
    PhoneNumberView()
}
