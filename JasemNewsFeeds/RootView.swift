//
//  JasemNewsFeedsApp.swift
//  JasemNewsFeeds
//
//  Created by Jasem on 10/09/2022.
//

import SwiftUI

@main
struct RootView: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                NewsListView()
            }
        }
    }
}
