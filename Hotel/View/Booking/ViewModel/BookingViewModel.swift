//
//  BookingViewModel.swift
//  Hotel
//
//  Created by Timur Kadiev on 24.12.2023.
//

import Foundation
import Combine

class BookingViewModel: ObservableObject {
    
    private var bookingDataService: BookingDataService
    private var cancellables = Set<AnyCancellable>()
    
    @Published var bookingInfo: TourPackage
    @Published var tourists = [Tourist()]
    @Published var email = String()
    @Published var fullPrice = 0
    var touristNumber: [String] = ["Первый","Второй","Третий", "Четвертый", "Пятый"]

    init(service: BookingDataService) {
        self.bookingDataService = service
        self.bookingInfo = TourPackage.mokeData
        addSubscribers()
    }
    
    private func addSubscribers() {
        bookingDataService.$bookingData
            .sink { [weak self] ( data ) in
                self?.bookingInfo = data
                self?.fullPrice = ((data.tourPrice ?? 0) + (data.fuelCharge ?? 0)  + (data.serviceCharge ?? 0))
            }
            .store(in: &cancellables)
    }
    
    func validation () -> Bool {
        if email.isEmpty {
            return false
        }
        
        for i in tourists {
            if i.name.isEmpty {
                return false
            }
        }
        for i in tourists {
            if i.surname.isEmpty {
                return false
            }
        }
        for i in tourists {
            if i.dateBirth.isEmpty {
                return false
            }
        }
        for i in tourists {
            if i.passportNumber.isEmpty {
                return false
            }
        }
        for i in tourists {
            if i.citizenship.isEmpty {
                return false
            }
        }
        for i in tourists {
            if i.validityPeriodPassport.isEmpty {
                return false
            }
        }
        return true
    }
}
