//
//  ContentView.swift
//  JusbarApp
//
//  Created by AbdelrahmanQasim on 12/28/21.
//

import SwiftUI

struct ContentView: View {
    @State var isFinishOnBoarding: Bool = false
    var body: some View {
        ZStack {
            if isFinishOnBoarding {
                MainView()
            } else {
                SplashView(isFinishOnBoarding: $isFinishOnBoarding)
            }
        }
        .transition(.move(edge: .bottom))
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
