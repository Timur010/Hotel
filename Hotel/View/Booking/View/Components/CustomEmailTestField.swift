//
//  CustomEmailTestField.swift
//  Hotel
//
//  Created by Timur Kadiev on 24.12.2023.
//

import SwiftUI

struct CustomEmailTextField: View {
    @Binding var email: String
    @Binding var status: Bool
    @FocusState private var isEmailFocused: Bool
    
    var isEmailValid: Bool {
        let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailPattern)
        return emailPred.evaluate(with: email)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Почта")
                .font(.system(size: 12))
                .foregroundStyle(Color.lightGrayColor)
                .padding(.top, 10)
            TextField("Введите email", text: $email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .focused($isEmailFocused)
                .padding(.bottom, 10)
        }
        .padding(.leading, 16)
        .background(!isEmailFocused && !isEmailValid && !email.isEmpty ? Color.errorColor : Color.textFieldColor)
        .cornerRadius(10)
    }
}

#Preview {
    CustomEmailTextField(email: .constant(""), status: .constant(false))
}
