//
//  TouchdownApp.swift
//  Touchdown
//
//  Created by paige on 2021/09/20.
//

import SwiftUI

@main
struct TouchdownApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Shop())
        }
    }
}
