//
//  OnBoardingView.swift
//  Fruit
//
//  Created by paige on 2021/09/17.
//

import SwiftUI

struct OnBoardingView: View {
    
    // MARK: - PROPERTIES
    var fruits: [Fruit] = fruitsData
    
    // MARK: - BODY
    
    var body: some View {
        TabView {
            ForEach(fruits[0...5]) {item in
                FruitCardView(fruit: item)
            }
        } //: TAB
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

// MARK: - PREVIEW

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView(fruits: fruitsData)
            .previewDevice("iPhone 11 Pro")
    }
}
