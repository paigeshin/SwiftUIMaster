//
//  HeadingView.swift
//  Africa
//
//  Created by paige on 2021/09/18.
//

import SwiftUI

struct HeadingView: View {
    var headingImage: String
    var headingText: String
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            Text(headingText)
                .font(.title)
                .fontWeight(.bold)
        }
        
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
