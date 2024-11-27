//
//  HistoryView.swift
//  MyFirstHIIT
//
//  Created by Esmond Yeo on 27/11/24.
//

import SwiftUI

struct HistoryView: View {
    let today = Date()
    let yesterday = Date().addingTimeInterval(-86400)
    let exercises1 = ["Squat", "Step Up", "Burpee", "Sun Salute"]
    let exercises2 = ["Squat", "Step Up", "Burpee"]
    var body: some View {
        VStack{
            Text("History")
                .font(.title)
                .padding()
            Form{
                Section(
                    header:
                        Text(today.formatted(.dateTime.month().day()))
                        .font(.headline)) {
                    // Section content
                            Text("Hello1")
                }
                Section(
                    header:
                        Text(yesterday.formatted(.dateTime.month().day()))
                        .font(.headline)) {
                            Text("Hello2")
                            //section conent
                }
            }
        }
    }
}

#Preview {
    HistoryView()
}
