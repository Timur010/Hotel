//
//  CustomPhoneTestField.swift
//  Hotel
//
//  Created by Timur Kadiev on 24.12.2023.
//

import SwiftUI

struct CustomPhoneTestField: View {
    @State public var phoneNumber = ""
    private let phoneMask = "(***)-**-**"

    var body: some View {
        TextField("(951) 555-99-00", text: $phoneNumber)
            .keyboardType(.numberPad)
            .onChange(of: phoneNumber) { newValue in
                applyPhoneMask(to: newValue)
            }
    }

    private func applyPhoneMask(to rawPhoneNumber: String) {
        let numbersOnly = rawPhoneNumber.filter { $0.isNumber }

        if numbersOnly.count > 10 { // ограничиваем количество цифр до 10
            phoneNumber = formatPhoneNumber(String(numbersOnly.prefix(10)))
            return
        }

        if rawPhoneNumber.count < phoneNumber.count,
           let lastCharacter = phoneNumber.last,
           lastCharacter.isNumber {
            phoneNumber = formatPhoneNumber(String(numbersOnly.dropLast()))
        } else {
            phoneNumber = formatPhoneNumber(numbersOnly)
        }
    }

    private func formatPhoneNumber(_ rawNumber: String) -> String {
        var result = ""
        var index = rawNumber.startIndex

        for ch in phoneMask {
            if ch == "*" {
                if index < rawNumber.endIndex {
                    result.append(rawNumber[index])
                    index = rawNumber.index(after: index)
                } else {
                    result.append("*")
                }
            } else {
                result.append(ch)
            }
        }

        return result
    }
}

#Preview {
    CustomPhoneTestField()
}
