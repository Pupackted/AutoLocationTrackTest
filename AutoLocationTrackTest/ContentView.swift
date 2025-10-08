//
//  ContentView.swift
//  AutoLocationTrackTest
//
//  Created by Adrian Yusufa Rachman on 08/10/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject private var locationManager = LocationManager.shared
    @StateObject private var activityMonitor = ActivityMonitor()
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Location Tracking").font(.headline)) {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image(systemName: "location.fill")
                                .foregroundColor(.blue)
                            Text("Status:")
                                .font(.headline)
                            Spacer()
                            Text(locationManager.isUpdatingLocation ? "Active" : "Inactive")
                                .foregroundColor(locationManager.isUpdatingLocation ? .green : .red)
                        }
                        
                        Text("Authorization: \(locationManager.authorizationStatusText)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        HStack(spacing: 15) {
                            Button(action: {
                                if locationManager.isUpdatingLocation {
                                    locationManager.stopLocationUpdate()
                                } else {
                                    locationManager.requestAlwaysAuthorization()
                                    locationManager.startSLC()
                                }
                            }) {
                                Text(locationManager.isUpdatingLocation ? "Stop Tracking" : "Start Tracking")
                                    .bold()
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(locationManager.isUpdatingLocation ? Color.red : Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.vertical)
                }

                Section(header: Text("Activity Tracking").font(.headline)) {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image(systemName: "figure.walk")
                                .foregroundColor(.orange)
                            Text("Status:")
                                .font(.headline)
                            Spacer()
                            Text(activityMonitor.isMonitoring ? "Monitoring" : "Not Monitoring")
                                .foregroundColor(activityMonitor.isMonitoring ? .green : .red)
                        }
                        
                        Text("Current Activity: \(activityMonitor.currentStatus)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Button(action: {
                            if activityMonitor.isMonitoring {
                                activityMonitor.stopUpdates()
                            } else {
                                activityMonitor.startUpdates()
                            }
                        }) {
                            Text(activityMonitor.isMonitoring ? "Stop Monitoring" : "Start Monitoring")
                                .bold()
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(activityMonitor.isMonitoring ? Color.red : Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.vertical)
                }
                
                Section(header: Text("Data").font(.headline)){
                    NavigationLink(destination: LocationPointsListView()) {
                        HStack{
                            Image(systemName: "map.fill")
                                .foregroundColor(.purple)
                            Text("View Location Points")
                        }
                    }
                    NavigationLink(destination: ActivitiesListView()) {
                        HStack {
                            Image(systemName: "list.bullet")
                                .foregroundColor(.yellow)
                            Text("View Activities")
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("AutoLocationTrack")
            .onAppear {
                locationManager.modelContext = modelContext
                activityMonitor.modelContext = modelContext
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [LocationPoint.self, ActivityEvent.self], inMemory: true)
}
