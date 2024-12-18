//
//  MyFirstApp.swift
//  MyFirst
//
//  Created by Esmond Yeo on 26/11/24.
//

import SwiftUI

@main
struct MyFirstApp: App {
    @StateObject private var historyStore = HistoryStore()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .alert(isPresented: $historyStore.loadingError){
                    Alert(
                        title: Text("History"),
                        message: Text(
                            """
                            Unfortunately we can't load your past history.
                            Email support: 
                                support@xyz.com
                            """
                        )
                    )
                }
                .environmentObject(historyStore)
        }
    }
}
