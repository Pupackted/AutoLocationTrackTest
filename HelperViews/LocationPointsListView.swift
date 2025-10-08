//
//  LocationPointsListView.swift
//  AutoLocationTrackTest
//
//  Created by Adrian Yusufa Rachman on 08/10/25.
//

import Foundation
import SwiftUI
import CoreLocation
import SwiftData

struct LocationPointsListView: View {
    @Query(sort: \LocationPoint.timestamp, order: .reverse) private var locationPoints: [LocationPoint]
    
    var body: some View {
        List(locationPoints) { point in
            HStack(spacing: 12) {
                Text(point.timestamp, style: .time)
                    .foregroundStyle(.secondary)
                Text("\(format(point.latitude)), \(format(point.longitude))")
                    .fontDesign(.monospaced)
                Spacer()
            }
        }
        .navigationTitle("Location Points")
    }
    
    private func format(_ value: CLLocationDegrees) -> String {
        String(format: "%.6f", value)
    }
}
