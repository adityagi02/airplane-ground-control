//
//  Notifications.swift
//  airplane ground control
//
//  Created by Aditya Tyagi  on 29/03/23.
//

import Foundation

struct Notifications: Identifiable {
    let id: Int
    let notification: String
    let notificationDescription: String
    let notifyTime: String

}

extension Notifications {
  static let previewNotification = [
    Notifications(id: 1, notification: "Abandoned Luggage, B3", notificationDescription: "Found a dark blue, medium sized American Tourister bag outside the belt 3 facing chairs, residing there for more than 4 hrs, as notices by crew present.", notifyTime: "09:23"),
    Notifications(id: 2, notification: "WheelChair Support, G5", notificationDescription: "We need a WheelChair Crew at Gate no. 9", notifyTime: "8:45"),
    Notifications(id: 3, notification: "Security Check SC3", notificationDescription: "Duty Change time.", notifyTime: "08:10"),
    Notifications(id: 4, notification: "Medical Emer.", notificationDescription: "A person at Gate 34, International Terminal 2, fainted with heavy breath and sweating. Ground Crew reached immediately and medical Services Staff are informed in no time. We are taking him to the Medical Care Unit, Terminal 2. 4 extra ground crew needed.", notifyTime: "07:50"),
    Notifications(id: 5, notification: "Illegal Baggage, SC6", notificationDescription: "A passenger has illegal amount of tobacco and narcotics.We need 3 securiyt personnels and a forensic officer at Security Check 6.", notifyTime: "05:32"),
    Notifications(id: 6, notification: "Abandoned Luggage, B3", notificationDescription: "Found a dark blue, medium sized American Tourister bag outside the belt 3 facing chairs, residing there for more than 4 hrs, as notices by crew present.", notifyTime: "03:34"),
    Notifications(id: 7, notification: "Narcotics Check", notificationDescription: "We need 3 security personnels and 2 Narcotics forensic officer at Security Check 6", notifyTime: "02:46"),
    Notifications(id: 8, notification: "Lost Luggage, B3", notificationDescription: "A passenger is not getting his luggage at Belt 3, Need a staff crew  at Domestic Terminal", notifyTime: "01:57")
  ]
}

