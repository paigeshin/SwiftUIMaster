//
//  FruitApp.swift
//  Fruit
//
//  Created by paige on 2021/09/17.
//

import SwiftUI

@main
struct FruitApp: App {
    
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnBoardingView()
            } else {
                ContentView()
            }
        }
    }
}
