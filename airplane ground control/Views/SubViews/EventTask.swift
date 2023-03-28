//
//  DatePlannerApp.swift
//  airplane ground control
//
//  Created by Aditya Tyagi  on 26/03/23.
//


import Foundation

struct EventTask: Identifiable, Hashable {
    var id = UUID()
    var text: String
    var isCompleted = false
    var isNew = false
}
