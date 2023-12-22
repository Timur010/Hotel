//
//  HotelRoomsView.swift
//  Hotel
//
//  Created by Timur Kadiev on 22.12.2023.
//

import SwiftUI

struct HotelRoomsView: View {
    @StateObject var vm = HotelRoomViewModel(service: HotelRoomDataService())
    var body: some View {
        ScrollView {
            ForEach(vm.hotelRoomInfo.rooms, id: \.self) { info in
                RoomView(roomData: info)
            }
        }
    }
}

#Preview {
    HotelRoomsView()
}
