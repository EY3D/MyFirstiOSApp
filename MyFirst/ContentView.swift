//
//  ContentView.swift
//  MyFirst
//
//  Created by Esmond Yeo on 26/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            ByeView()
                
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
