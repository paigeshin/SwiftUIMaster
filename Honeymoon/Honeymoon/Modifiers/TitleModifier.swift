//
//  TitleModifier.swift
//  Honeymoon
//
//  Created by paige on 2021/09/22.
//

import SwiftUI

struct TitleModifer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(Color.pink)
    }
}
