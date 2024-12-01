//
//  HeaderView.swift
//  MyFirstHIIT
//
//  Created by Esmond Yeo on 26/11/24.
//

import SwiftUI

struct HeaderView: View {
    @Binding var selectedTab: Int
    let titleText: String
    
    var body: some View {
        VStack {
            Text(titleText).font(.largeTitle)
            HStack {
                ForEach(Exercise.exercises.indices, id: \.self){i in
                    let fill = i == selectedTab ? ".fill" : ""
                    Image(systemName: "\(i + 1).circle\(fill)")
                        .onTapGesture {
                            selectedTab = i
                        }
                }
            }.font(.title2)
        }
    }
}

#Preview {
    HeaderView(selectedTab: .constant(0), titleText: "TestSquat")
}
