//
//  HomeViewModel.swift
//  Hotel
//
//  Created by Timur Kadiev on 21.12.2023.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    private var hotelService: HomeDataService
    private var cancellables = Set<AnyCancellable>()
    
    @Published var selectedBanner = 0
    @Published var baner: [String?] = ["Image", "Image","Image", "Image"]
    @Published var categorie: [String?] = ["3-я линия", "Платный Wi-Fi в фойе", "30 км до аэропорта", "1 км до пляжа"]
    @Published var hotelInfo: Hotel

    init(service: HomeDataService) {
        self.hotelService = service
        self.hotelInfo = Hotel.mockHomeData
        addSubscribers()
    }

    private func addSubscribers() {
        hotelService.$hotel
            .sink { [weak self] ( hotel ) in
                self?.hotelInfo = hotel
                self?.baner = hotel.imageUrls
                self?.categorie = hotel.aboutTheHotel?.peculiarities ?? []
                print(hotel)
            }
            .store(in: &cancellables)
    }
}
