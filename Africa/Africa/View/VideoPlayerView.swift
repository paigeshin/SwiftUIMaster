//
//  VideoPlayerView.swift
//  Africa
//
//  Created by paige on 2021/09/19.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    var videoSelected: String
    var videoTitle: String
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: "cheetah", fileFormat: "mp4"))
                .overlay(
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 320)
                        .padding(.top, 6)
                        .padding(.horizontal, 8)
                    ,alignment: .topLeading
                )
        }
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle, displayMode: .inline)
        
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    
    static var previews: some View {
        VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
    }
}
