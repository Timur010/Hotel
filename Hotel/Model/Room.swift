//
//  Room.swift
//  Hotel
//
//  Created by Timur Kadiev on 22.12.2023.
//

import Foundation

import Foundation

struct RoomData: Codable {
    var rooms: [Room]
}

struct Room: Codable, Identifiable, Hashable{
    var id: Int?
    var name: String?
    var price: Int?
    var pricePer: String?
    var peculiarities: [String?]
    var imageUrls: [String?]

    private enum CodingKeys: String, CodingKey {
        case id, name, price, peculiarities
        case pricePer = "price_per"
        case imageUrls = "image_urls"
    }
    
    static var mockRoom: Room {
        return Room(peculiarities: [], imageUrls: [])
    }
}
