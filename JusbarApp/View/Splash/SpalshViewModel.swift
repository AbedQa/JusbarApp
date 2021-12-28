//
//  SpalshViewModel.swift
//  JusbarApp
//
//  Created by AbdelrahmanQasim on 12/28/21.
//

import SwiftUI

class SpalshViewModel: ObservableObject {
    
    private var onBoardingList: [OnBoarding] = [
        .init(image: "sp1", description: "It’s available in your favorite cities now and thy wait! go and order four favorite juices ", slideColor: Color(hex: .illusionColor)),
        .init(image: "sp2", description: "Juice is a beverage made from the extraction or pressing out of natural liquid contained good quality fruits", slideColor: Color(hex: .yellowOrangeColor)),
        .init(image: "sp3", description: "User can look for their favorite juices and buy it through the online gateway process or through cash on delivery", slideColor: Color(hex: .malibuColor)),
    ]
    
    @Published private(set) var currentOnBoardingSelected:OnBoarding!
    @Published private(set) var currentSelectedIndex: Int = 0
    
    init() {
        currentOnBoardingSelected = onBoardingList[0]
    }
    
    func showNextItemOnBoarding() {
        withAnimation(.easeInOut) {
            currentSelectedIndex += 1
            
            if currentSelectedIndex == 3 {
                currentSelectedIndex = 0
            }
            currentOnBoardingSelected = onBoardingList[currentSelectedIndex]
        }
    }
    
}
