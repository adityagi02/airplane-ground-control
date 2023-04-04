//
//  NotificationCard.swift
//  airplane ground control
//
//  Created by Varun Sharma on 11/03/23.
//

import SwiftUI

struct NotificationCard: View {
    
    let notification: String
    let notificationDescription: String
    let notifyTime: String
    var body: some View {
        VStack(spacing:10) {
            HStack() {
                Text(notification).bold().foregroundColor(.red).multilineTextAlignment(.leading)
                Spacer(minLength: 5)
                Text(notifyTime).multilineTextAlignment(.trailing)
            }.multilineTextAlignment(.trailing)
            Text(notificationDescription).multilineTextAlignment(.leading)
        }.frame(width: 340, alignment: .trailing)
    }
}


