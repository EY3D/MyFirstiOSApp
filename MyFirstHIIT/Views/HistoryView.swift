//
//  HistoryView.swift
//  MyFirstHIIT
//
//  Created by Esmond Yeo on 27/11/24.
//

import SwiftUI

struct HistoryView: View {
    @Binding var showHistory: Bool
    
    //let history = HistoryStore()
    @EnvironmentObject var history: HistoryStore
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack{
                Text("History")
                    .font(.title)
                    .padding()
                Form{
                    ForEach(history.exerciseDays) {ed in
                        Section(
                            header: Text(ed.date.formatted(.dateTime.day().month().year())))
                        {
                            ForEach(ed.exercises, id:\.self) {exercise in
                                Text(exercise)
                            }
                        }
                    }
                }
            }
            Button(action: {showHistory.toggle()}) {
                Image(systemName: "x.circle")
                    .font(.title)
                    .padding()
            }
        }
    }
}

#Preview {
    HistoryView(showHistory: .constant(false))
        .environmentObject(HistoryStore())
}
