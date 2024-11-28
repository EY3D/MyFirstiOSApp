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

struct HistoryStore {
    var exerciseDays: [ExerciseDay] = []
    
    init() {
        #if DEBUG
        createDevData()
        #endif
    }
}

