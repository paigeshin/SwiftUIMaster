//
//  GuidevIEW.swift
//  Honeymoon
//
//  Created by paige on 2021/09/22.
//

import SwiftUI

struct GuideView: View {
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HeaderComponent()
                Spacer(minLength: 10)
                Text("Get Started!")
                    .fontWeight(.black)
                    .modifier(TitleModifer())
        
                Text("Discover and pick the perfect destinatino for your romantic Honeymoon!")
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                Spacer(minLength: 10)
                VStack(alignment: .leading, spacing: 25) {
                    GuideComponent(
                        title: "Like", subtitle: "Swipe right", description: "Do you like this destination? Touch the screen and swipe right. It will be saved to the favorites", icon: "heart.circle"
                    )
                    GuideComponent(
                        title: "Dismiss", subtitle: "Swipe left", description: "Would you reather skip this place? Touch the screen and swipe left. You will no longer see it.", icon: "xmark.circle"
                    )
                    GuideComponent(
                        title: "Book", subtitle: "Tap the button", description: "Our selection of honeymoon resorts is perfect setting for you to embark your new life together", icon: "checkmark.square"
                    )
                }
                Spacer(minLength: 10)
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Continue".uppercased())
                        .font(.headline)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Capsule().fill(Color.pink))
                        .foregroundColor(Color.white)
                })
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
        }
    }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}
