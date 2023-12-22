//
//  CoordinatorView.swift
//  Hotel
//
//  Created by Timur Kadiev on 22.12.2023.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject var coordinator = Coordinator()
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .Home)
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
        }
        .environmentObject(coordinator)
    }
}

#Preview {
    CoordinatorView()
}
