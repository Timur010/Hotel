//
//  Hotel.swift
//  Hotel
//
//  Created by Timur Kadiev on 22.12.2023.
//

import Foundation

struct Hotel: Codable {
    let id: Int?
    let name: String?
    let adress: String?
    let minimalPrice: Int?
    let priceForIt: String?
    let rating: Int?
    let ratingName: String?
    let imageUrls: [String?]
    let aboutTheHotel: AboutTheHotel?

    enum CodingKeys: String, CodingKey {
        case id, name, adress, rating
        case minimalPrice = "minimal_price"
        case priceForIt = "price_for_it"
        case ratingName = "rating_name"
        case aboutTheHotel = "about_the_hotel"
        case imageUrls = "image_urls"
    }

    struct AboutTheHotel: Codable {
        let description: String?
        let peculiarities: [String?]
    }
    
    static var mockHomeData: Hotel {
        return Hotel(id: nil, name: nil, adress: nil, minimalPrice: nil, priceForIt: nil, rating: nil, ratingName: nil, imageUrls: [], aboutTheHotel: nil)
    }
}
