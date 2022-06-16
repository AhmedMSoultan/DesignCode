//
//  NotificationModel.swift
//  DesignCode-UIKit
//
//  Created by Ahmed Soultan on 28/04/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct NotificationModel: Hashable , Codable {
    @DocumentID var id: String?
    var title: String!
    var subtitle: String!
    var message: String!
    var image: String!
    var sentAt: Timestamp!
}

enum TBSection: CaseIterable {
case main
}
