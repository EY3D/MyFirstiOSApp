//
//  RatingView.swift
//  MyFirstHIIT
//
//  Created by Esmond Yeo on 27/11/24.
//

import SwiftUI

struct RatingView: View {
    var body: some View {
        HStack {
            ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { _ in
                Image(systemName: "bolt.heart")
                    .foregroundColor(.gray)
                    .font(.largeTitle)
            }
        }//.border(Color.red)
    }
}

#Preview {
    RatingView()
}
