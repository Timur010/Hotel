//
//  TourPackage.swift
//  Hotel
//
//  Created by Timur Kadiev on 24.12.2023.
//

import Foundation

struct TourPackage: Codable {
    var id: Int?
    var hotelName: String?
    var hotelAdress: String?
    var hoRating: Int?
    var ratingName: String?
    var departure: String?
    var arrivalCountry: String?
    var tourDateStart: String?
    var tourDateStop: String?
    var numberOfNights: Int?
    var room: String?
    var nutrition: String?
    var tourPrice: Int?
    var fuelCharge: Int?
    var serviceCharge: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case hotelName = "hotel_name"
        case hotelAdress = "hotel_adress"
        case hoRating = "horating"
        case ratingName = "rating_name"
        case departure
        case arrivalCountry = "arrival_country"
        case tourDateStart = "tour_date_start"
        case tourDateStop = "tour_date_stop"
        case numberOfNights = "number_of_nights"
        case room
        case nutrition
        case tourPrice = "tour_price"
        case fuelCharge = "fuel_charge"
        case serviceCharge = "service_charge"
    }
    static var mokeData: TourPackage {
        return TourPackage()
    }
}
