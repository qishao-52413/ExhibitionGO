//
//  ContentView.swift
//  逛展GO！
//
//  Created by 祁邵 on 2026/2/23.
//

import SwiftUI
import SwiftData

struct PlanView: View {
    @Query private var eventinfo: [CosplayEvent]
    @State private var isShowPopup = false
    @State private var isShowingSheet = false
    var body: some View {
        NavigationStack{
            ScrollView{
                if eventinfo.isEmpty {
                    Spacer()
                    // 空状态提示
                    ContentUnavailableView(
                        "暂无活动",
                        systemImage: "calendar.badge.exclamationmark",
                        description: Text("你还没有添加任何展出计划。\n点击右上角 + 号添加。")
                    )
                }else{
                    ForEach(eventinfo) { event in
                        NavigationLink{
                            MapView()
                        }label:{
                            Text(event.roleName)
                                .font(.headline)
                                .foregroundColor(.primary) // 强制颜色
                            
                            Text(event.workName)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("未来计划")
            .navigationBarTitleDisplayMode(.automatic)
            .sheet(isPresented: $isShowPopup) {
                AddNewEventView() // 弹出的内容视图」
            }
            .toolbar {
                ToolbarItem (placement: .topBarTrailing){
                    Button {
                        isShowPopup = true
                    }label: {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(Color.red)
                    }
                }
                ToolbarItem(placement:.topBarLeading){
                    Menu {
                        Button("Coser",systemImage: "plus"){
                            print("刷新")
                        }
                        Button("摄影师"){
                            print("排序")
                        }
                        Button("化妆师"){
                            print("排序")
                        }
                        Button("游客"){
                            print("排序")
                        }
                    } label: {
                        HStack(spacing:4){
                            Image(systemName: "person.crop.circle.fill")
                            Text("角色")
                        }
                    }
                    //                    Button {
                    //                        isShowingSheet = true
                    //                    }label: {
                    //                        Image(systemName: "person.crop.circle.fill")
                    //                            .resizable()
                    //                            .scaledToFill()
                    //                            .frame(width: 24, height: 24)
                    //                            .foregroundStyle(Color.red)
                    //                        Text("角色")
                    //                    }
                }
                ToolbarItem(placement: .topBarLeading){
                    Menu(content: {Button(action: {}, label: {Text("233")})}, label: {Text("233")})
                }
            
            }
        }

    }
}
    //            VStack(alignment: .center){
    ////                Image(systemName: "atom")
    ////                    .imageScale(.large)
    ////                    .foregroundStyle(.tint)
    ////                Text("欢迎来到逛展GO!")
    //                HStack(alignment: .center){
    //                    Image(systemName: "arrow.down.forward.circle.fill")
    //                        .imageScale(.large)
    //                        .foregroundStyle(Color.green)
    //                    Text("未来计划").font(.title)
    //                        .foregroundStyle(Color.green)
    //                    Menu {
    //                        Button(action: {}) {
    //                            Text("Open in Preview")
    //                            Text("View the document in Preview")
    //                        }
    //                        Button(action: {}) {
    //                            Text("Save as PDF")
    //                            Text("Export the document as a PDF file")
    //                        }
    //                    }label: {
    //                        Label("添加",systemImage: "plus.circle.fill")
    //                    }
    //                    Spacer()
    //
    //                }
    //                Spacer()
    //
    //                Spacer()
    //
    //            }
    
#Preview {
    PlanView()
}
