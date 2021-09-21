//
//  CreditsView.swift
//  Africa
//
//  Created by paige on 2021/09/20.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            Text("""
    Copyright, Paige Shin
    All right reserved
    Better Apps Less Code
    """)
                .font(.footnote)
                .multilineTextAlignment(.center)
        }
        .padding()
        .opacity(0.4)
    }
    

}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
    }
}
