//
//  SettingView.swift
//  逛展GO！
//
//  Created by 祁邵 on 2026/2/24.
//

import SwiftUI
import SwiftData

struct SettingsView: View {
    @State private var searchText = ""
    @Query(sort: \CosplayEvent.roleName, order: .reverse)  private var eventinfo: [CosplayEvent]
    @Environment(\.modelContext) private var modelContext
    var body: some View {
        NavigationStack{
            List{
                NavigationLink{
                    PlanView()
                }label:{
                    Image(systemName: "arrow.down.forward.circle.fill")
                    Text("goto")
                }
                NavigationLink{
                    MapView()
                }label:{
                    Text("map")
                }
                if eventinfo.isEmpty {
                    // 空状态提示
                    ContentUnavailableView(
                        "暂无活动",
                        systemImage: "calendar.badge.exclamationmark",
                        description: Text("你还没有添加任何展出计划。\n点击右上角 + 号添加。")
                    )
                }else{
                    ForEach(eventinfo) { event in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(event.roleName)
                                .font(.headline)
                                .foregroundColor(.primary) // 强制颜色
                            
                            Text(event.workName)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                        }
                        
                    }
                }
                PhotosSelector()
                
            }
            .searchable(text: $searchText,prompt: "233")
            .searchPresentationToolbarBehavior(.avoidHidingContent)
            .navigationTitle("设置")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItem (placement: .topBarTrailing){
                    Button {
                        
                    }label: {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .foregroundStyle(Color.red)
                        Text("查找")
                    }
                }
            }
        }
//            NavigationLink{
//                MapView()
//            }
//            label:{
//                Image(systemName: "arrow.down.forward.circle.fill")
//                    .labelStyle(.automatic)
//                    .padding()
//                    .buttonStyle(PlainButtonStyle())
//                    .glassEffect(.regular.interactive())
//            }
        
        
        
    }
    private func deleteEvent(_ event: CosplayEvent) {
           withAnimation {
               modelContext.delete(event) // 标记删除
               try? modelContext.save()   // 保存更改
           }
       }

}

#Preview {
    SettingsView()
}
