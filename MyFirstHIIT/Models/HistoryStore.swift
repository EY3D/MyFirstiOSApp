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
    @Published var loadingError = false
    var dataURL: URL {
        URL.documentsDirectory.appendingPathComponent("history.plist")
    }
    
    init() {
        print("HistoryStore initialized")
        loadingError = true
        
#if DEBUG
        //createDevData()
#endif
        
        do {
            try load()
        } catch {
            print("Error :", error)
        }
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
        do {
            try save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func save() throws {
        let plistData = exerciseDays.map { exerciseDay in
            [
                exerciseDay.id.uuidString,
                exerciseDay.date,
                exerciseDay.exercises
            ]
            
        }
        
        let plistData2 = exerciseDays.map {
            [
                $0.id.uuidString,
                $0.date,
                $0.exercises
            ]
        }
        
        do {
            let data = try PropertyListSerialization.data(
                fromPropertyList: plistData2,
                format: .binary,
                options: .zero)
            try data.write(to: dataURL, options: .atomic)
        } catch {
            throw FileError.saveFailure
        }
    }
    
    func load() throws {
        //throw FileError.loadFailure
        guard let data = try? Data(contentsOf: dataURL) else {
            return
        }
        do {
            let plistData = try PropertyListSerialization.propertyList(
                from: data,
                options: [],
                format: nil)
            let convertedPlistData = plistData as? [[Any]] ?? []
            exerciseDays = convertedPlistData.map {
                ExerciseDay(
                    date: $0[1] as? Date ?? Date(),
                    exercises: $0[2] as? [String] ?? []
                )
            }
        } catch {
            throw FileError.loadFailure
        }
    }
    
    enum FileError: Error {
        case loadFailure
        case saveFailure
    }
}

