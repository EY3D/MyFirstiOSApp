//
//  ContentView.swift
//  MyFirst
//
//  Created by Esmond Yeo on 26/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 9
    var body: some View {
        TabView(selection: $selectedTab) {
            WelcomeView(selectedTab: $selectedTab)
                .tag(9)
                .tabItem { Image(systemName: "house") }
            ForEach(Exercise.exercises.indices, id:\.self) {
                i in ExerciseView(selectedTab: $selectedTab, index: i)
                    .tag(i)
            }
        }
        .environmentObject(HistoryStore())
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.default, value: selectedTab)
    }
}
#Preview {
    ContentView()
}
