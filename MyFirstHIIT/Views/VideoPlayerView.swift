//
//  VideoPlayerView.swift
//  MyFirstHIIT
//
//  Created by Esmond Yeo on 27/11/24.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    let videoName: String
    var body: some View {
        if let url = Bundle.main.url(forResource:videoName, withExtension: "mp4") {
            let avplayer = AVPlayer(url: url)
            VideoPlayer(player: avplayer)
                .onAppear {
                    NotificationCenter
                        .default
                        .addObserver(
                            forName: .AVPlayerItemDidPlayToEndTime,
                            object: avplayer.currentItem,
                            queue: .main
                        ) { _ in
                            avplayer.seek(to: .zero)
                            debugPrint("Reached end of video for", videoName)
                            avplayer.play()
                        }
                    avplayer.play()
                }
                .onDisappear {
                    avplayer.pause()
                }
        }
        else {
            Text("Couldn't find video \(videoName).mp4")
                .foregroundColor(.red)
        }
        
    }
}

#Preview {
    VideoPlayerView(videoName: "squat")
}

