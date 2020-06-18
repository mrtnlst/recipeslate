//
//  NotificationHandler.swift
//  Recipe Slate
//
//  Created by Martin List on 18.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

class NotificationHandler: NSObject {
    
    public static func post(_ notification: Notification.Name, object: Any?) {
        NotificationCenter.default.post(name: notification,
                                        object: object, userInfo: nil)
    }

}
