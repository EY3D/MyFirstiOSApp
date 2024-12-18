//
//  RatingView.swift
//  MyFirstHIIT
//
//  Created by Esmond Yeo on 27/11/24.
//

import SwiftUI

struct RatingView: View {
    let exerciseIndex: Int
    @AppStorage("ratings") private var ratings = "1000"
    @State private var rating = 0
    
    let maxRating: Int = 5
    let onColor: Color = .red
    let offColor: Color = .gray
    
    func updateRating(index: Int) {
        rating = index
        let index = ratings.index(
            ratings.startIndex,
            offsetBy: exerciseIndex)
        ratings.replaceSubrange(index...index, with: String(rating)
        )
    }
    
    var body: some View {
        HStack {
            ForEach(0 ..< maxRating) { i in
                Image(systemName: "bolt.heart")
                    .font(.largeTitle)
                    .foregroundColor(rating > i ? onColor : offColor)
                    .onTapGesture{ updateRating(index: i) }
                    .onAppear{
                        let index = ratings.index(
                            ratings.startIndex,
                            offsetBy: exerciseIndex)
                        let character = ratings[index]
                        rating = character.wholeNumberValue ?? 0
                        
                    }
            }
        }//.border(Color.red)
    }
}

#Preview {
    RatingView(exerciseIndex:3)
}
