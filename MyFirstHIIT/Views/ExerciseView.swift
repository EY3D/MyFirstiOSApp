//
//  ExerciseView.swift
//  MyFirst
//
//  Created by Esmond Yeo on 26/11/24.
//

import SwiftUI
import AVKit

struct ExerciseView: View {
    var exercise: Exercise {
        Exercise.exercises[index]
    }
    let index: Int
    var body: some View {
        VStack {
            HeaderView(exerciseName: exercise.exerciseName)
            if let url = Bundle.main.url(forResource:exercise.videoName, withExtension: "mp4") {
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
                                debugPrint("Reached end of video")
                                avplayer.play()
                            }
                    avplayer.play()
                }
                    .onDisappear {
                        avplayer.pause()
                    }
                    .frame(height: 300)
            } else {
                Text("Couldn't find video \(exercise.videoName).mp4")
                    .foregroundColor(.red)
            }
            Text("Timer")
            Text("Start/Done Button")
            Text("Rating")
            Text("History Button")
        }
    }
}

#Preview {
    ExerciseView(index: 0)
}


