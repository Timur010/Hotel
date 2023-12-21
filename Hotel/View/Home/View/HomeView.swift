//
//  ContentView.swift
//  Hotel
//
//  Created by Timur Kadiev on 20.12.2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = HomeViewModel()
    var body: some View {
        VStack (spacing: 0) {
            ScrollView (showsIndicators: false) {
                VStack {
                    mainView
                    details
                }
                .background(Color.gray.opacity(0.2).cornerRadius(10))
            }
            .padding(.top, 60)
            .background(Color.white.cornerRadius(0))
            
            Divider()
           
            Text("К выбору номера")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(Color.white)
                .frame(width: UIScreen.main.bounds.width - 32)
                .padding(.vertical, 15)
                .background(Color.blue.cornerRadius(20))
                .padding(.top, 12)
                .padding(.bottom, 28)
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
            ZStack (alignment: .bottom) {
                TabView(selection: $vm.curr.animation()) {
                    ForEach(0..<vm.baner.count, id: \.self)  { image in
                        BannerView(image: vm.baner[image])
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: 257)
                
                HStack {
                    ForEach(vm.baner.indices, id: \.self) { index in
                        Circle()
                            .fill(vm.curr == index ? Color.black : Color.gray.opacity(1 - Double(abs(vm.curr - index)) / Double(vm.baner.count)))
                            .frame(width: 7, height: 7)
                    }
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Color.white.cornerRadius(5))
                .padding(.bottom, 8)
            }
        }
    }
    private var grade: some View {
        HStack {
            HStack(spacing: 2) {
                Image(systemName: "star.fill")
                    .resizable()
                    .foregroundStyle(Color.orangeColor)
                    .frame(width: 15, height: 15)
                Text("5 превосхожно")
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
                    Text("Steigenberger Makadi")
                        .font(.system(size: 22, weight: .medium))
                    Text("Madinat Makadi, Safaga Road, Makadi Bay, Египет")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(Color.blue)
                }
                Spacer()
            }
            HStack (alignment: .bottom) {
                Text("от 134 673 ₽")
                    .font(.system(size: 30, weight: .semibold))
                Text("за тур с перелётом")
                    .font(.system(size: 16))
                    .foregroundStyle(Color.gray)
                Spacer()
            }
            .padding(.top)
        }
    }
    private var categories: some View {
        VStack {
            Text("Об отеле")
                .font(.system(size: 22, weight: .medium))
            TagLayout() {
                ForEach(vm.categorie, id: \.self) { item in
                    Text(item)
                        .font(.system(size: 16, weight: .medium))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color.backgroundСustomСolor)
                        .foregroundColor(Color.lightGrayColor)
                        .cornerRadius(5)
                }
            }
        }
    }
    private var detailDescription: some View {
        VStack {
            Text("Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!")
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
