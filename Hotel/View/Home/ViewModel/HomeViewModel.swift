//
//  HomeViewModel.swift
//  Hotel
//
//  Created by Timur Kadiev on 21.12.2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var curr = 0
    @Published var baner: [String] = ["Image", "Image","Image", "Image"]
    @Published var categorie: [String] = ["3-я линия", "Платный Wi-Fi в фойе", "30 км до аэропорта", "1 км до пляжа"]
}
