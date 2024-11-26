//
//  HeaderView.swift
//  MyFirstHIIT
//
//  Created by Esmond Yeo on 26/11/24.
//

import SwiftUI

struct HeaderView: View {
    let exerciseName: String;
    var body: some View {
        VStack {
            Text(exerciseName).font(.largeTitle)
            HStack {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
                Image(systemName: "4.circle")
            }.font(.title2)
        }
    }
}
