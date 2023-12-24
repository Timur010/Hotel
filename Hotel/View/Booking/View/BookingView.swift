//
//  BookingView.swift
//  Hotel
//
//  Created by Timur Kadiev on 23.12.2023.
//

import SwiftUI

struct BookingView: View {
    @StateObject var viewModel = BookingViewModel(service: BookingDataService())
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var coordinator: Coordinator
    @State var status = false
    
    var body: some View {
        VStack (spacing: 0) {
            Divider()
            ScrollView(showsIndicators: false) {
                Spacer()
                    .frame(width: 8)
                title
                bookingInfo
                buyerInformation
                
                ForEach(Array(viewModel.tourists.enumerated()), id: \.offset) { index, tourist in
                    TouristInformationView(tourist: $viewModel.tourists[index], title: viewModel.touristNumber[index], status: $status)
                }
                
                buttonAddition
                
                VStack (spacing: 16) {
                    PaymentInformationView(title: "Тур", value: viewModel.bookingInfo.tourPrice ?? 0)
                    PaymentInformationView(title: "Топливный сбор", value: viewModel.bookingInfo.fuelCharge ?? 0)
                    PaymentInformationView(title: "Сервисный сбор", value: viewModel.bookingInfo.serviceCharge ?? 0)
                    PaymentInformationView(title: "К оплате", value: viewModel.fullPrice)
                    
                }
                .padding()
                .background(Color.white.cornerRadius(15))
                Spacer()
                    .frame(width: 8)
                
            }
            .frame(width: UIScreen.main.bounds.width)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image("Arrow Left")
            })
            .background(Color.scrollViewColor)
            
            Divider()

            CustomButtonView(title: "Оплатить \(viewModel.fullPrice)") {
                status = true
                if viewModel.validation() {
                    coordinator.push(.Paid)
                }
            }
            .padding(.bottom, -28)
            
        }
        .background(Color.white)
    }
}

#Preview {
    BookingView()
}

extension BookingView {
    private var title: some View {
        VStack {
            HStack {
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(Color.orangeColor)
                        .frame(width: 15, height: 15)
                    Text("\(viewModel.bookingInfo.hoRating ?? 0) \(viewModel.bookingInfo.ratingName ?? "")")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundStyle(Color.orangeColor)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Color.lightOrangeColor.cornerRadius(5))
                Spacer()
            }
            HStack {
                VStack (alignment: .leading) {
                    Text(viewModel.bookingInfo.hotelName ?? "")
                        .font(.system(size: 22, weight: .medium))
                        .lineLimit(1)
                    Text(viewModel.bookingInfo.hotelAdress ?? "")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(Color.blue)
                }
                Spacer()
            }
        }
        .padding()
        .background(Color.white.cornerRadius(15))
    }
    private var bookingInfo: some View {
        VStack(alignment: .leading, spacing: 20) {
            BookingDetailsView(title: "Вылет из", text: viewModel.bookingInfo.departure ?? "")
            BookingDetailsView(title: "Страна, город", text: viewModel.bookingInfo.arrivalCountry ?? "")
            BookingDetailsView(title: "Даты", text: "\(viewModel.bookingInfo.tourDateStart ?? "") – \(viewModel.bookingInfo.tourDateStop ?? "")")
            BookingDetailsView(title: "Кол-во ночей", text: "\(viewModel.bookingInfo.numberOfNights ?? 0) ночей")
            BookingDetailsView(title: "Отель", text: "Steigenberger Makadi")
            BookingDetailsView(title: "Номер", text: viewModel.bookingInfo.room ?? "")
            BookingDetailsView(title: "Питание", text: viewModel.bookingInfo.nutrition ?? "")
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white.cornerRadius(15))
       
    }
    private var buyerInformation: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Информация о покупателе")
                .foregroundStyle(Color.black)
                .font(.system(size: 22, weight: .medium))
            
            PhoneNumberView()
                .padding(.top, 12)
            CustomEmailTextField(email: $viewModel.email, status: $status)
                
            Text("Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту")
                .foregroundStyle(Color.lightGrayColor)
                .font(.system(size: 14, weight: .regular))
        }
        .padding()
        .background(Color.white.cornerRadius(15))
    }
    private var buttonAddition: some View {
        HStack {
            Text("Добавить туриста")
                .font(.system(size: 22, weight: .medium))
                .foregroundStyle(Color.black)
            Spacer()
            Button {
                withAnimation {
                    if viewModel.tourists.count < 5 {
                        viewModel.tourists.append(Tourist())
                    }
                }
            } label: {
                Image("Plus")
                    .padding(4)
                    .background(Color.blue.cornerRadius(6))
            }
        }
        .padding(.vertical, 13)
        .padding(.horizontal)
        .background(Color.white.cornerRadius(15))
    }
}


