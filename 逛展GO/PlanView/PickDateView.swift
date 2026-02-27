//
//  PickDateView.swift
//  逛展GO
//
//  Created by 祁邵 on 2026/2/27.
//

import SwiftUI

struct PickDateView: View {
    @State private var showConfirmDialog = false
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack {
            Text("这是 Sheet 的第二页")
        }
        .navigationTitle("第二页标题")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("下一步", destination: PickDateView())
                .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    PickDateView()
}
