//
//  AutoLocationTrackTestApp.swift
//  AutoLocationTrackTest
//
//  Created by Adrian Yusufa Rachman on 08/10/25.
//

import SwiftUI
import SwiftData

@main
struct trackingApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    let container: ModelContainer
    
    init() {
        do {
            container = try ModelContainer(for: LocationPoint.self, ActivityEvent.self)
            AppDelegate.container = container
        } catch {
            fatalError("Failed to create ModelContainer for the app.")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
}
