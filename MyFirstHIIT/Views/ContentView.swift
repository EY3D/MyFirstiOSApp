//
//  ContentView.swift
//  MyFirst
//
//  Created by Esmond Yeo on 26/11/24.
//

import SwiftUI

struct ContentView: View {
    @SceneStorage("selectedTab") private var selectedTab = 9

  var body: some View {
    TabView(selection: $selectedTab) {
      WelcomeView(selectedTab: $selectedTab)  // 1
        .tag(9)  // 2
      ForEach(Exercise.exercises.indices, id: \.self) { index in
        ExerciseView(selectedTab: $selectedTab, index: index)
          .tag(index)  // 3
      }
    }
    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    .onAppear{print(URL.documentsDirectory)}
  }
}

#Preview {
    ContentView()
        .environmentObject(HistoryStore())
}
