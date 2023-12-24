//
//  Coordinator.swift
//  Hotel
//
//  Created by Timur Kadiev on 22.12.2023.
//

import SwiftUI

enum Page: String, Hashable {
    case Home, Room, Booking, Paid
    
    var id: String {
        self.rawValue
    }
}

class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .Home:
            HomeView()
        case .Room:
            HotelRoomsView()
                .navigationTitle("Steigenberger Makadi")
        case .Booking:
            BookingView()
                .navigationTitle("Бронирование")
        case .Paid:
            PaidView()
                .navigationTitle("Заказ оплачен")
        }
    }
}
