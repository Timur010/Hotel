//
//  BookingDataService.swift
//  Hotel
//
//  Created by Timur Kadiev on 24.12.2023.
//

import Foundation
import Combine

class BookingDataService {
    @Published var bookingData: TourPackage = TourPackage.mokeData
    var dataSubscription: AnyCancellable?

    init() {
        getData()
    }

   func getData()  {
        guard let url = URL(string: "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff") else { return }

        dataSubscription = NetworkingManager.download(url: url)
            .decode(type: TourPackage.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] info in
                self?.bookingData = info
                self?.dataSubscription?.cancel()
            })
    }
}
