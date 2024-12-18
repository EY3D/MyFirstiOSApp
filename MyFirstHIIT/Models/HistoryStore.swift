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
        
        print("today is \(today)")
        
        if exerciseDays.isEmpty {
            print("HistoryStore.exerciseDays empty, adding \(exerciseName)")
            exerciseDays.append(ExerciseDay(date: today, exercises:[exerciseName]))
        } else if Calendar.current.isDate(today, inSameDayAs: exerciseDays[0].date) {
            print("exerciseDays[0].date is \(exerciseDays[0].date) which is a same date as \(today)")
            print("Adding \(exerciseName) to today")
            exerciseDays[0].exercises.append(exerciseName)
        } else {
            print("exerciseDays[0].date is \(exerciseDays[0].date) which is a different date from \(today)")
            exerciseDays.insert(ExerciseDay(date: today, exercises:[exerciseName]), at: 0)
        }
        
        print("History: ", exerciseDays)
    }
}

