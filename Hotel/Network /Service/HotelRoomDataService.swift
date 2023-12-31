//
//  HotelRoomDataService.swift
//  Hotel
//
//  Created by Timur Kadiev on 22.12.2023.
//

import Foundation
import Combine

class HotelRoomDataService {
    @Published var roomData: RoomData = RoomData(rooms: [])
    var dataSubscription: AnyCancellable?

    init() {
        getData()
    }

   func getData()  {
        guard let url = URL(string: "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195") else { return }

        dataSubscription = NetworkingManager.download(url: url)
            .decode(type: RoomData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] info in
                self?.roomData = info
                self?.dataSubscription?.cancel()
            })
    }
}
