//
//  __GOApp.swift
//  逛展GO
//
//  Created by 祁邵 on 2026/2/27.
//

import SwiftUI
import SwiftData

@main
struct __GOApp: App {
    var body: some Scene {
        WindowGroup {
            NavigatView()
        }
        .modelContainer(for:CosplayEvent.self)
    }
}
