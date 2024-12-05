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
    @State private var showHistory = false
    @State private var showSuccess = false
    @Binding var selectedTab: Int
    
    var exercise: Exercise {
        Exercise.exercises[index]
    }
    
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
            if lastExercise {
                showSuccess = true
            } else {
                selectedTab += 1
            }
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
                        .sheet(isPresented: $showSuccess) {
                            SuccessView(selectedTab: $selectedTab)
                                .presentationDetents([.medium])
                        }
                }
                RatingView(rating: $rating).padding()
                Spacer()
                Button("History") {
                    showHistory.toggle()
                }
//                    .buttonStyle(.bordered)
                    .padding(.bottom)
                    .sheet(isPresented: $showHistory){
                        HistoryView(showHistory: $showHistory)
                    }
            }
        }
    }
}
#Preview {
    ExerciseView(selectedTab: .constant(3), index: 3)
}


