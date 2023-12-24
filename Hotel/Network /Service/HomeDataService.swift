//
//  HomeDataService.swift
//  Hotel
//
//  Created by Timur Kadiev on 22.12.2023.
//

import Foundation
import Combine

class HomeDataService {
    @Published var hotel: Hotel = Hotel.mockHomeData
    var dataSubscription: AnyCancellable?

    init() {
        getData()
    }

   func getData()  {
        guard let url = URL(string: "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473") else { return }

        dataSubscription = NetworkingManager.download(url: url)
            .decode(type: Hotel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] info in
                self?.hotel = info
                self?.dataSubscription?.cancel()
            })
    }
}

