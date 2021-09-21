//
//  CardModel.swift
//  Developer
//
//  Created by paige on 2021/09/21.
//

import SwiftUI

struct Card: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
}
