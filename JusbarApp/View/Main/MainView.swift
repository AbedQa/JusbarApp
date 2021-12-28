//
//  MainView.swift
//  JusbarApp
//
//  Created by AbdelrahmanQasim on 12/28/21.
//

import SwiftUI

struct MainView: View {
    @State var tabItemIndexSelected = 0
    var body: some View {
        VStack {
            ZStack {
                Text("Jusbar")
                    .scaledFont(name: .bold, size: 14)
                    .foregroundColor(Color(hex: .silverChaliceColor))
                HStack {
                    
                    Spacer()
                    Image(systemName: "bell.fill")
                        .font(.title2)
                        .foregroundColor(Color(hex: .mischkaColor))
                }
                .padding(.horizontal)
            }
            
            TabView(selection: $tabItemIndexSelected) {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                            .foregroundColor(tabItemIndexSelected == 0 ? Color(hex: .pigeonPostColor) : Color(hex: .mischkaColor)).onTapGesture {
                                tabItemIndexSelected = 0
                            }
                    }
                
                
                Text("Cart")
                    .foregroundColor(.black)
                    .scaledFont(name: .medium, size: 20)
                    .tabItem {
                        Image(systemName: "cart.fill")
                            .foregroundColor(tabItemIndexSelected == 0 ? Color(hex: .pigeonPostColor) : Color(hex: .mischkaColor)).onTapGesture {
                                tabItemIndexSelected = 1
                            }
                    }
                
                Text("Profile")
                    .foregroundColor(.black)
                    .scaledFont(name: .medium, size: 20)
                    .tabItem {
                        Image(systemName: "person.fill")
                            .foregroundColor(tabItemIndexSelected == 0 ? Color(hex: .pigeonPostColor) : Color(hex: .mischkaColor)).onTapGesture {
                                tabItemIndexSelected = 2
                            }
                    }
            }.onAppear {
                UITabBar.appearance().barTintColor = .white
                UITabBar.appearance().backgroundColor = .white
            }
            .accentColor(Color(hex: .pigeonPostColor))
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
