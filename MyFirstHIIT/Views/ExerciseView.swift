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
    
    @EnvironmentObject var history: HistoryStore
    
    var exercise: Exercise {
        Exercise.exercises[index]
    }
    
    let index: Int
    //let interval: TimeInterval = 30
    @State private var timerDone = false
    @State private var showTimer = false
    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }
    
    var startButton: some View {
        Button("Start Exercise") {
            showTimer.toggle()
        }
            .font(.title3).padding()
    }
    
    var doneButton: some View {
        Button("Done") {
            print("Done button of exercise clicked")
            print("Adding \(Exercise.exercises[index].exerciseName) to history")
            history.addDoneExercise(Exercise.exercises[index].exerciseName)
            
            timerDone = false
            showTimer = false
            
            if lastExercise {
                showSuccess = true
            } else {
                selectedTab += 1
            }
        }.font(.title3).padding()
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing:0) {
                HeaderView(selectedTab: $selectedTab, titleText: exercise.exerciseName)
                    .padding(.bottom)
                VideoPlayerView(videoName: exercise.videoName)
                    .frame(height: geometry.size.height * 0.45)
                HStack(spacing: 150) {
                    startButton
                        .disabled(showTimer)
                        .buttonStyle(.borderedProminent)
                    doneButton
                        .disabled(!timerDone) //is disabled when timer is not done
                        .sheet(isPresented: $showSuccess) {
                            SuccessView(selectedTab: $selectedTab)
                                .presentationDetents([.medium, .large])
                        }
                }.font(.title3)
                    .padding()
                
                if showTimer {
                    TimerView(
                        timerDone: $timerDone,
                        size: geometry.size.height * 0.07
                    )
                }
                
                Spacer()
                
                RatingView(rating: $rating)
                    .padding()
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
    ExerciseView(selectedTab: .constant(0), index: 0)
    .environmentObject(HistoryStore())
}


