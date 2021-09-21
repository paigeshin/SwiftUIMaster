//
//  FruitRowView.swift
//  Fruit
//
//  Created by paige on 2021/09/18.
//

import SwiftUI

struct FruitDetailView: View {
    
    // MARK: - PROPERTEIS
    var fruit: Fruit
    
    // MARK: - BODY
    
    
    var body: some View {
        Text(fruit.title)
    }
}

struct FruitRowView_Previews: PreviewProvider {
    static var previews: some View {
        FruitRowView(fruit: fruitsData[0])
            .previewDevice("iPhone 11 Pro")
    }
}
