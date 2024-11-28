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
    let interval: TimeInterval = 30
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(titleText: exercise.exerciseName)
                    .padding(.bottom)
                VideoPlayerView(videoName: exercise.videoName)
                    .frame(height: geometry.size.height * 0.45)
                Text(Date().addingTimeInterval(interval), style: .timer)
                    .font(.system(size: geometry.size.height * 0.07))
                Button("Start/Next") {}
                    .font(.title3)
                    .padding()
                    .buttonStyle(.borderedProminent)
                RatingView().padding()
                Spacer()
                Button("History") {}
                    .buttonStyle(.bordered)
                    .padding(.bottom)
            }
        }
    }
}
#Preview {
    ExerciseView(index: 0)
}


