//
//  ExerciseView.swift
//  MyFirst
//
//  Created by Esmond Yeo on 26/11/24.
//

import SwiftUI
import AVKit

struct ExerciseView: View {
    @State private var rating = 0
    var exercise: Exercise {
        Exercise.exercises[index]
    }
    @Binding var selectedTab: Int
    let index: Int
    let interval: TimeInterval = 30
    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }
    
    var startButton: some View {
        Button("Start Exercise") {}
            .font(.title3).padding()
    }
    
    var doneButton: some View {
        Button("Done") {
            selectedTab = lastExercise ? 9 : selectedTab + 1
        }.font(.title3).padding()
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(selectedTab: $selectedTab, titleText: exercise.exerciseName)
                    .padding(.bottom)
                VideoPlayerView(videoName: exercise.videoName)
                    .frame(height: geometry.size.height * 0.45)
                Text(Date().addingTimeInterval(interval), style: .timer)
                    .font(.system(size: geometry.size.height * 0.07))
                HStack(spacing: 150) {
                    startButton
                    doneButton
                }
                RatingView(rating: $rating).padding()
                Spacer()
                Button("History") {}
//                    .buttonStyle(.bordered)
                    .padding(.bottom)
            }
        }
    }
}
#Preview {
    ExerciseView(selectedTab: .constant(1), index: 1)
}


