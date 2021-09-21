//
//  CenterModifier.swift
//  Africa
//
//  Created by paige on 2021/09/20.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
