//
//  DatePlanner.swift
//  airplane ground control
//
//  Created by Aditya Tyagi  on 26/03/23.
//

import SwiftUI

struct DatePlanner: View {
    @StateObject private var eventData = EventData()
    
    var body: some View {
        NavigationView {
            EventList()
            Text("Select an Event")
                .foregroundStyle(.secondary)
        }
        .environmentObject(eventData)
    }
}




