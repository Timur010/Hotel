//
//  ContentView.swift
//  Hotel
//
//  Created by Timur Kadiev on 20.12.2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = HomeViewModel(service: HomeDataService())
    @EnvironmentObject var coordinator: Coordinator
    var body: some View {
        VStack (spacing: 0) {
            ScrollView (showsIndicators: false) {
                VStack {
                    mainView
                    details
                }
                .background(Color.scrollViewColor.cornerRadius(10))
            }
            .padding(.top, 60)
            .background(Color.white.cornerRadius(0))
            
            Divider()
            CustomButtonView(title: "К выбору номера") {
                coordinator.push(.Room)
            }
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}

extension HomeView {
    private var mainView: some View {
        VStack {
            banner
            grade
            description
        }
        .padding()
        .background(Color.white.cornerRadius(12))
    }
    private var details: some View {
        VStack(alignment: .leading) {
            categories
            detailDescription
        }
        .padding()
        .background(Color.white.cornerRadius(12))
    }
    private var banner: some View {
        VStack {
            Text("Отель")
                .font(.system(size: 18, weight: .medium))
            BannerView(baner: vm.baner)
        }
    }
    private var grade: some View {
        HStack {
            HStack(spacing: 2) {
                Image(systemName: "star.fill")
                    .resizable()
                    .foregroundStyle(Color.orangeColor)
                    .frame(width: 15, height: 15)
                Text(" \(vm.hotelInfo.rating ?? 0) " + (vm.hotelInfo.ratingName ?? ""))
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(Color.orangeColor)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color.lightOrangeColor.cornerRadius(5))
            Spacer()
        }
    }
    private var description: some View {
        VStack {
            HStack {
                VStack (alignment: .leading) {
                    Text(vm.hotelInfo.name ?? "")
                        .font(.system(size: 22, weight: .medium))
                        .lineLimit(1)
                    Text(vm.hotelInfo.adress ?? "")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(Color.blue)
                }
                Spacer()
            }
            HStack (alignment: .bottom) {
                Text("от \(vm.hotelInfo.minimalPrice ?? 0) ₽")
                    .font(.system(size: 30, weight: .semibold))
                Text(vm.hotelInfo.priceForIt ?? "")
                    .font(.system(size: 16))
                    .foregroundStyle(Color.lightGrayColor)
                    .baselineOffset((16) / 4)
                Spacer()
            }
            .padding(.top)
        }
    }
    private var categories: some View {
        VStack {
            Text("Об отеле")
                .font(.system(size: 22, weight: .medium))
            CategoriesView(categories: vm.categorie)
        }
    }
    private var detailDescription: some View {
        VStack {
            Text(vm.hotelInfo.aboutTheHotel?.description ?? "")
                .font(.system(size: 16, weight: .regular))
            
            VStack (alignment: .trailing, spacing: 10) {
                SwitchDetailedView(image: "Emoji-happy", title: "Удобства", text: "Самое необходимое")
                
                Divider()
                    .frame(width: 275)
                
               SwitchDetailedView(image: "Tick-square", title: "Что включено", text: "Самое необходимое")
                
                Divider()
                    .frame(width: 275)
               SwitchDetailedView(image: "Close-square", title: "Что не включено", text: "Самое необходимое")
              
            }
            .padding()
            .background(Color.backgroundСustomСolor.cornerRadius(15))
        }
    }
}
