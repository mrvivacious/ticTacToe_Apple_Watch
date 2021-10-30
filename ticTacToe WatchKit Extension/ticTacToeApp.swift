//
//  ticTacToeApp.swift
//  ticTacToe WatchKit Extension
//
//  Created by Vivek Bhookya on 10/29/21.
//

import SwiftUI

@main
struct ticTacToeApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
