//
//  HotelRoomViewModel.swift
//  Hotel
//
//  Created by Timur Kadiev on 22.12.2023.
//

import Foundation
import Combine

class HotelRoomViewModel: ObservableObject {
    private var hotelRoomService: HotelRoomDataService
    private var cancellables = Set<AnyCancellable>()
    
    @Published var hotelRoomInfo: RoomData

    init(service: HotelRoomDataService) {
        self.hotelRoomService = service
        self.hotelRoomInfo = RoomData(rooms: [])
        addSubscribers()
    }
    
    private func addSubscribers() {
        hotelRoomService.$roomData
            .sink { [weak self] ( room ) in
                self?.hotelRoomInfo = room
            }
            .store(in: &cancellables)
    }
}
