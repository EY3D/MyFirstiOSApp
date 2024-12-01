//
//  WelcomeView.swift
//  MyFirst
//
//  Created by Esmond Yeo on 26/11/24.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            VStack {
                HeaderView(selectedTab: $selectedTab, titleText: "Welcome")
                Spacer()
                Button("History") {
                    
                }
                .padding(.bottom)
            }
            VStack{
                HStack(alignment: .bottom){
                    VStack(alignment: .leading) {
                        Text("Get Fit")
                            .font(.largeTitle)
                        Text("with high intensity interval training")
                            .font(.headline)
                    }
                    Image("step-up")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(
                            width: 200,height: 200)
                        .clipShape(.circle)
                }.padding()
                Button(action: {selectedTab = 0}){
                    Text("Get Started")
                    Image(systemName: "arrow.right.circle")
                }
                .font(.title2)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 2))
            }
        }
    }
}

#Preview {
    WelcomeView(selectedTab: .constant(9))
}
