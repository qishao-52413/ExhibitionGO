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
        TabView{
//            PlanView().tabItem(){
//                Image(systemName: "list.bullet.clipboard")
//                Text("计划")
//            }
//            HistoricalView().tabItem(){
//                Label("历史",systemImage: "folder.fill")
//            }
//            MapView().tabItem(){
//                Label("地图",systemImage: "map.fill")
//            }
//            SettingView().tabItem(){
//                Label("设置",systemImage: "gearshape.fill")
//            }
            Tab("计划", systemImage: "list.bullet.clipboard") {
                NavigationStack {
                    PlanView()
                }
            }
            Tab("历史", systemImage: "folder.fill") {
                NavigationStack {
                    HistoricalView()
                }
            }
            Tab("地图", systemImage: "map.fill") {
                NavigationStack {
                    MapView()
                }
            }
            Tab("设置", systemImage: "gearshape.fill") {
                NavigationStack {
                    SettingsView()
                }
                .navigationTitle("设置")
                .navigationBarTitleDisplayMode(.automatic)
            }
        }
        .tabViewStyle(.sidebarAdaptable)
        .tint(Color.red)
        //        .tabBarMinimizeBehavior(.onScrollDown)
        //        .tabViewBottomAccessory{
        //            Text("233333")
        //            }
        }
}
#Preview {
    NavigatView()
}

//struct navi: View {
//    enum Tab: Int {
//        case home, mall, my
//    }
//    @State var selectedTab = Tab.home
//    var body: some View {
//        NavigationView{
//            TabView(selection: $selectedTab) {
//                ContentView().tag(Tab.home) .tabItem {
//                    if selectedTab == .home { Image("Relax")
//                    } else {
//                        Image("shouye-a")
//                    }
//                    Text("首页")
//                }
//                ContentView().tag(Tab.mall) .tabItem {
//                    if selectedTab == .mall { Image("jfsc-b")
//                    } else {
//                        Image("jfsc-a")
//                    }
//                    Text("积分商城")
//                }
//                ContentView().tag(Tab.my) .tabItem {
//                    if selectedTab == .my { Image("user_b")
//                    } else {
//                        Image("user_a")
//                    }
//                    Text("我的")
//                }
//            }.accentColor(Color.red)
//        }
//    }
//}
