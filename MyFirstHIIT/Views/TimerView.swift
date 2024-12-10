//
//  TimerView.swift
//  MyFirstHIIT
//
//  Created by Esmond Yeo on 8/12/24.
//

import SwiftUI

struct TimerView: View {
    @State private var timeRemaining = 3
    @Binding var timerDone: Bool
    let size: Double
    
    var body: some View {
        TimelineView(
            .animation(
                minimumInterval: 1.0,
                paused: timeRemaining == 0)) {
                    context in
                    CountdownView(
                        date: context.date,
                        timeRemaining: $timeRemaining,
                        size: size
                    )
                }
                .onChange(of: timeRemaining) { _ in
                        if timeRemaining == 0 {
                        timerDone = true
                    }
                }
    }
}

struct CountdownView: View {
    let date: Date
    @Binding var timeRemaining: Int
    let size: Double
    
    var body: some View {
        Text("\(timeRemaining)")
            .font(.system(size: size, design: .rounded))
            .padding()
            .onChange(of: date) { _ in
                timeRemaining -= 1
            }
    }
}

#Preview {
    TimerView(timerDone: .constant(false), size: 90)
}
