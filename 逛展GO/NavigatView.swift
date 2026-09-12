//
//  navibar.swift
//  逛展GO！
//
//  Created by 祁邵 on 2026/2/23.
//

import SwiftUI

struct NavigatView :View {
    @State var value:Bool = true
    var body: some View {
        if #available(iOS 18.0, *) {
            TabView{
                PlanView().tabItem{
                    Label("计划", systemImage: "list.bullet.clipboard")
                }
                HistoricalView().tabItem {
                    Label("历史", systemImage: "folder.fill")
                }
                MapView().tabItem{
                    Label("地图", systemImage: "map.fill")
                }
                SettingsView().tabItem{
                    Label("设置", systemImage: "gearshape.fill")
                }
                
            }
            .tint(Color.red)
            .tabViewStyle(.sidebarAdaptable)
        } else {
            TabView{
                PlanView().tabItem{
                    Label("计划", systemImage: "list.bullet.clipboard")
                }
                HistoricalView().tabItem {
                    Label("历史", systemImage: "folder.fill")
                }
                MapView().tabItem{
                    Label("地图", systemImage: "map.fill")
                }
                SettingsView().tabItem{
                    Label("设置", systemImage: "gearshape.fill")
                }
                
            }
            .tint(Color.red)
            // Fallback on earlier versions
        }
        //        .tabBarMinimizeBehavior(.onScrollDown)
        //        .tabViewBottomAccessory{
        //            Text("233333")
        //            }
        }
}
#Preview {
    NavigatView()
}

