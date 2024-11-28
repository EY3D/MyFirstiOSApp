//
//  SuccessView.swift
//  MyFirstHIIT
//
//  Created by Esmond Yeo on 28/11/24.
//

import SwiftUI

struct SuccessView: View {
    var body: some View {
        ZStack {
            VStack{
                Image(systemName: "hand.raised.fill")
                
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(
                        width: 75,height: 75)
                    .foregroundColor(.purple)
                Text("High Five!").font(.largeTitle.bold())
                Text("""
                  Good job completing all four exercises!
                  Remember tomorrow's another day.
                  So eat well and get some rest.
                  """)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                
            }
            VStack{
                Spacer()
                Button("Continue"){}
                    .padding(.bottom)
            }
        }
        
    }
}

#Preview {
    SuccessView()
}