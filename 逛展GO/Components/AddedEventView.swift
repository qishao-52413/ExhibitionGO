//
//  AddedEventView.swift
//  逛展GO
//
//  Created by 祁邵 on 2026/2/26.
//

import SwiftUI

struct ContentView1: View {
    @State private var isSheetPresented = false

    var body: some View {
        Button("Open Sheet") {
            isSheetPresented = true
        }
        .sheet(isPresented: $isSheetPresented) {
            // 关键点：Sheet 内部必须有一个独立的 NavigationStack
            NavigationStack {
                FirstSheetView()
            }
        }
    }
}

struct FirstSheetView: View {
    var body: some View {
        VStack {
            Text("这是 Sheet 的第一页")
            NavigationLink("跳转到第二页", destination: SecondSheetView())
        }
        .navigationTitle("第一页标题")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("跳转到第二页", destination: SecondSheetView())
            }
        }
    }
}

struct SecondSheetView: View {
    var body: some View {
        VStack {
            Text("这是 Sheet 的第二页")
        }
        .navigationTitle("第二页标题")
        .toolbar {
            // 关键点：第二页定义自己的 Toolbar，NavigationStack 会自动替换
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("第二页操作") {
                    print("Clicked Second Page Toolbar")
                }
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button("关闭") {
                    // 模拟关闭逻辑
                }
            }
        }
    }
}

#Preview{
    ContentView()
}
