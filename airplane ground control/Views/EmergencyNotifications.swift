//
//  EmergencyNotifications.swift
//  airplane ground control
//
//  Created by Varun Sharma on 11/03/23.
//

import SwiftUI

struct EmergencyNotifications: View {
    
    let notifications = Notifications.previewNotification.sorted { $0.notifyTime < $1.notifyTime }
    var body: some View {
        //NavigationView {
            VStack(spacing: 105) {
                List(notifications) { notification in
                    NotificationCard(notification: notification.notification, notificationDescription: notification.notificationDescription, notifyTime: notification.notifyTime)
                }.navigationTitle("Notifications")
            }
        }
    // }
}

struct EmergencyNotifications_Previews: PreviewProvider {
    static var previews: some View {
        EmergencyNotifications()
    }
}
