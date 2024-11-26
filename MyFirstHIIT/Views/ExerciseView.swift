//
//  ExerciseView.swift
//  MyFirst
//
//  Created by Esmond Yeo on 26/11/24.
//

import SwiftUI

struct ExerciseView: View {
    var exercise: Exercise {
        Exercise.exercises[index]
    }
    let index: Int
    var body: some View {
        VStack {
            HeaderView(exerciseName: exercise.exerciseName)
            Text("Video Player")
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


