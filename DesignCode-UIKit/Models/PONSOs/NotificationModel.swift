//
//  NotificationModel.swift
//  DesignCode-UIKit
//
//  Created by Ahmed Soultan on 28/04/2022.
//

import Foundation
import FirebaseFirestore

struct NotificationModel: Hashable , Codable {
    var id: String?
    var title: String!
    var subtitle: String!
    var message: String!
    var image: String!
    var sentAt: Date!
}

enum TBSection: CaseIterable {
case main
}

let sampleNotifications = [

    NotificationModel(id: "0x1", title: "New Release", subtitle: "SwiftUI", message: "A new release of the SwiftUI course has been released", image: "Logo SwiftUI", sentAt: Date()),
    
    NotificationModel(id: "0x2", title: "Content Update", subtitle: "React Hooks", message: "The React Hooks course has been updated", image: "Logo React", sentAt: Date()),
    
    NotificationModel(id: "0x3", title: "New Release", subtitle: "UIKit for iOS 15", message: "A new release of the SwiftUI advanced course has been pushed", image: "Logo SwiftUI", sentAt: Date()),
    
    NotificationModel(id: "0x4", title: "Black Friday Deal", subtitle: "SwiftUI", message: "Purchase your subscription for 20% off only today", image: "Logo DC", sentAt: Date()),
]
