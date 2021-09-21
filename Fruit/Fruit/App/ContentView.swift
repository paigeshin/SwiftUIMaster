//
//  ContentView.swift
//  Fruit
//
//  Created by paige on 2021/09/17.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTEIS
    
    @State private var isShowingSettings: Bool = false
    
    var fruits: [Fruit] = fruitsData
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            List {
                ForEach(fruits.shuffled()) { item in
                    NavigationLink(
                        destination: FruitDetailView(fruit: item)) {
                        FruitRowView(fruit: item)
                            .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Fruits")
            .navigationBarItems(trailing: Button(action: {
                isShowingSettings = true
            }, label: {
                Image(systemName: "slider.horizontal.3")
            })) //: Button
            .sheet(isPresented: $isShowingSettings) {
                SettingsView()
            }
        } // :NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle()) //ipad
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
            .previewDevice("iPhone 11 Pro")
    }
}
