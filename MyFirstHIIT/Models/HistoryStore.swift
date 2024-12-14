//
//  HistoryStore.swift
//  MyFirstHIIT
//
//  Created by Esmond Yeo on 28/11/24.
//

import Foundation

struct ExerciseDay: Identifiable {
    let id = UUID()
    let date: Date
    var exercises: [String] = []
}

class HistoryStore: ObservableObject {
    @Published var exerciseDays: [ExerciseDay] = []
    
    init() {
        print("HistoryStore initialized")
        #if DEBUG
        //createDevData()
        
        #endif
    }
    
    func addDoneExercise(_ exerciseName: String){
        let today = Date()
        if exerciseDays.isEmpty {
            print("HistoryStore.exerciseDays empty, adding \(exerciseName)")
            exerciseDays.append(ExerciseDay(date: today, exercises:[exerciseName]))
        } else if today == exerciseDays[0].date {
            print("Adding \(exerciseName) to today")
            exerciseDays[0].exercises.append(exerciseName)
        } else {
            exerciseDays.insert(ExerciseDay(date: today, exercises:[exerciseName]), at: 0)
        }
    }
}

