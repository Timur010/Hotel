//
//  CategoriesView.swift
//  Hotel
//
//  Created by Timur Kadiev on 22.12.2023.
//

import SwiftUI

struct CategoriesView: View {
    var categories: [String?]
    var body: some View {
        TagLayout() {
            ForEach(categories, id: \.self) { item in
                Text(item ?? "")
                    .font(.system(size: 16, weight: .medium))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color.backgroundСustomСolor)
                    .foregroundColor(Color.lightGrayColor)
                    .cornerRadius(5)
            }
        }
    }
}

#Preview {
    CategoriesView(categories: [])
}
