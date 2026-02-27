//
//  AddNewEventButton.swift
//  逛展GO
//
//  Created by 祁邵 on 2026/2/25.
//

import SwiftUI

// 弹出的页面内容
struct AddNewEventView: View {
    // 获取环境变量用于关闭弹窗
    @State private var isNexton = false
    @State private var showConfirmDialog = false
    @Environment(\.dismiss) private var dismiss
    @State var cosplayName = ""
    @State var workName = ""
    
    var body: some View {
        NavigationStack {
            FillCosplayInfoView()
        }.interactiveDismissDisabled(true)//忽略用户下滑手势
    }
}



#Preview {
    AddNewEventView()
}
