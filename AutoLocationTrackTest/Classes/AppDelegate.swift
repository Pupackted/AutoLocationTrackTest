//
//  AppDelegate.swift
//  AutoLocationTrackTest
//
//  Created by Adrian Yusufa Rachman on 08/10/25.
//

import Foundation
import UIKit
import SwiftUI
import CoreLocation
import SwiftData

class AppDelegate: UIResponder, UIApplicationDelegate {
    static var container: ModelContainer?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if launchOptions?[.location] != nil {
            print("App re-launched by a location event.")
            if UserDefaults.standard.bool(forKey: "isTrackingEnabled") {
                let locationManager = LocationManager.shared
                if let container = AppDelegate.container {
                    locationManager.modelContext = ModelContext(container)
                }
                locationManager.startLocationUpdate()
            }
        }
        return true
    }
}
