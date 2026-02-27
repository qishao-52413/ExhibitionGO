//
//  Item.swift
//  逛展GO
//
//  Created by 祁邵 on 2026/2/27.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
