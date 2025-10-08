//
//  ActivitiesListView.swift
//  AutoLocationTrackTest
//
//  Created by Adrian Yusufa Rachman on 08/10/25.
//

import Foundation
import SwiftUI
import SwiftData

struct ActivitiesListView: View {
    @Query(sort: \ActivityEvent.timestamp, order: .reverse) private var activities: [ActivityEvent]
    
    var body: some View {
        List(activities) { event in
            HStack(spacing: 12) {
                Text(format(date: event.timestamp))
                    .fontDesign(.monospaced)
                Text(event.status)
                Spacer()
            }
        }
        .navigationTitle("Activities")
    }
    
    private func format(date: Date) -> String {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return df.string(from: date)
    }
}
