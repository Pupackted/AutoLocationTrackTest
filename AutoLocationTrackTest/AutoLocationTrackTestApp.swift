//
//  AutoLocationTrackTestApp.swift
//  AutoLocationTrackTest
//
//  Created by Adrian Yusufa Rachman on 08/10/25.
//

import SwiftUI
import SwiftData

@main
struct AutoLocationTrackTestApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            LocationPoint.self,
            ActivityEvent.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
