//
//  RatingView.swift
//  MyFirstHIIT
//
//  Created by Esmond Yeo on 27/11/24.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    let maxRating: Int = 5
    let onColor: Color = .red
    let offColor: Color = .gray
    
    var body: some View {
        HStack {
            ForEach(0 ..< rating) { i in
                Image(systemName: "bolt.heart")
                    .font(.largeTitle)
                    .foregroundColor(rating > i ? onColor : offColor)
                    .onTapGesture{ rating = i + 1 }
            }
        }//.border(Color.red)
    }
}

#Preview {
    RatingView(rating:.constant(3))
}
