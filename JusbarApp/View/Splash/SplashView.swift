//
//  SplashView.swift
//  JusbarApp
//
//  Created by AbdelrahmanQasim on 12/28/21.
//

import SwiftUI

struct SplashView: View {
    @ObservedObject var splashViewModel = SpalshViewModel()
    @Binding var isFinishOnBoarding: Bool
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                Image(splashViewModel.currentOnBoardingSelected.image)
                Text(splashViewModel.currentOnBoardingSelected.description)
                    .scaledFont(name: .regular, size: 14)
                    .foregroundColor(Color(hex: .silverChaliceColor))
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 60)
            .padding(.bottom, 60)

            
            HStack {
                ForEach(0..<3) { index in
                    Capsule()
                        .fill()
                        .foregroundColor(splashViewModel.currentSelectedIndex == index ? splashViewModel.currentOnBoardingSelected.slideColor : Color(hex: .alabasterColor))
                        .frame(width: 50, height: 8)
                }
                
            }
            .padding(.bottom, 60)

            Text("SKIP")
                .scaledFont(name: .regular, size: 14)
                .foregroundColor(Color(hex: .silverChaliceColor))
                .onTapGesture {
                    withAnimation {
                        isFinishOnBoarding.toggle()
                    }
                }
            
            Spacer()
        }.onReceive(timer) { _ in
            splashViewModel.showNextItemOnBoarding()
        }
        .transition(.slide)
    }
}
