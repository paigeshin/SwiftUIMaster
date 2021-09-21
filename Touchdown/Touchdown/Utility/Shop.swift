//
//  Shop.swift
//  Touchdown
//
//  Created by paige on 2021/09/20.
//

import Foundation

class Shop: ObservableObject {
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: Product? = nil
}
