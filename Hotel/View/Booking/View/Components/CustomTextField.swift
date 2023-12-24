//
//  CustomTextField.swift
//  Hotel
//
//  Created by Timur Kadiev on 24.12.2023.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    @Binding var status: Bool
    @State var title: String
    @State var stub: String
    @State var state: Bool = false
    @FocusState private var islFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if state {
                Text(title)
                    .font(.system(size: 12))
                    .foregroundStyle(Color.lightGrayColor)
                    .padding(.top, 10)
            }
            
            TextField(stub, text: $text, onEditingChanged: { eddit in
                if text.isEmpty {
                    withAnimation {
                        state = eddit
                    }
                }
            })
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
            .focused($islFocused)
            .padding(.bottom, state ? 10 : 0)
        }
        .padding(.leading,  state ? 16 : 0)
        .padding(state ? 0 : 16)
        .background(status && text.isEmpty ? Color.errorColor : Color.textFieldColor)
        .cornerRadius(10)
        
    }
}
