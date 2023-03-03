//
//  NotificationModel.swift
//  TBV_CLTV
//
//  Created by Vu Khanh on 03/03/2023.
//

import Foundation

enum NotificationType {
    case hasButton
    case noButton
}
struct NotificationModel {
    let imgUrl: String
    let title: String
    let detail: String
    let notifyType: NotificationType
    
}
