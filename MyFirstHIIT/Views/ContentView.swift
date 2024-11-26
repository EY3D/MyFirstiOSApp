//
//  ContentView.swift
//  MyFirst
//
//  Created by Esmond Yeo on 26/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                WelcomeView()
                ForEach(Exercise.exercises.indices, id: \.self) { i in
                    ExerciseView(index: i)
                }
                Text("Exercise 2")
                
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
}
#Preview {
    ContentView()
}
