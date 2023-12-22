//
//  HotelRoomsView.swift
//  Hotel
//
//  Created by Timur Kadiev on 22.12.2023.
//

import SwiftUI

struct HotelRoomsView: View {
    @StateObject var vm = HotelRoomViewModel(service: HotelRoomDataService())
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack (spacing: 0) {
            Divider()
            ScrollView(showsIndicators: false) {
                Spacer()
                    .frame(width: 8)
                ForEach(vm.hotelRoomInfo.rooms, id: \.self) { info in
                    RoomView(roomData: info)
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image("Arrow Left")
            })
            .background(Color.gray.opacity(0.1))
            
        }
        .background(Color.white)
    }
}

#Preview {
    HotelRoomsView()
}
