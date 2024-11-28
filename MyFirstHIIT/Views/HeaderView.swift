//
//  HeaderView.swift
//  MyFirstHIIT
//
//  Created by Esmond Yeo on 26/11/24.
//

import SwiftUI

struct HeaderView: View {
    let titleText: String;
    var body: some View {
        VStack {
            Text(titleText).font(.largeTitle)
            HStack {
                Image(systemName: "hand.wave")
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
                Image(systemName: "4.circle")
            }.font(.title2)
        }
    }
}
