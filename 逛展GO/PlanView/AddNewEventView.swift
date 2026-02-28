//
//  AddNewEventButton.swift
//  逛展GO
//
//  Created by 祁邵 on 2026/2/25.
//

import Foundation
import SwiftData
import SwiftUI

@Model//数据库模型
final class CosplayEvent {
    var roleName: String      // 角色名称
    var workName: String      // 作品名称
    //var ImageData: Data?      // 图片二进制数据
    //var EventDate: Date       // 活动时间
    
    //, imageData: Data?, eventDate: Date = Date()
    init(roleName: String, workName: String) {
        self.roleName = roleName
        self.workName = workName
        //self.ImageData = imageData
        //self.EventDate = eventDate
    }
}


// 弹出的页面内容
struct AddNewEventView: View {
    @Environment(\.modelContext) private var modelContext    // 获取环境变量用于关闭弹窗
    @State private var isNexton = false
    @State private var showConfirmDialog = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            FillCosplayInfoView()
        }.interactiveDismissDisabled(true)//忽略用户下滑手势
    }
}

struct IntroduceFillCosplay: View {
    @State private var showConfirmDialog = false
    @State private var isNexton = false
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack(spacing:20){
            Group{
                
            }
        }
        .toolbar {
            // 右上角关闭按钮
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("下一步", destination: FillCosplayInfoView())
                    .fontWeight(.bold)
            }
            ToolbarItem(placement: .topBarLeading) {
                Button("取消") {
                    showConfirmDialog = true // 关闭弹窗
                }.confirmationDialog("放弃修改？", isPresented: $showConfirmDialog) {
                    Button("是的，放弃", role: .destructive) {
                        dismiss()
                    }
                    Button("继续编辑", role: .cancel) {
                        // 什么都不做
                    }
                } message: {
                    Text("未保存的内容将丢失。")
                }
                .fontWeight(.bold)
            }
        }
        .navigationTitle("添加一个新的活动")
        .navigationBarTitleDisplayMode(.large)
        
    }
}//暂时未设计介绍页面



struct FillCosplayInfoView: View {
    @State var roleName:String = ""
    @State var workName:String = ""
//    @State private var draft = EventDraft()     //初始化临时文件储存
    @State private var isNexton = false
    @State private var showConfirmDialog = false
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            GroupBox(){
                VStack(alignment: .leading){
                    Text("角色名称:")
                        .font(.title3)
                    
                    TextField("输入例如：十六夜咲夜", text: $roleName)
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.primary)
                }
                Divider()
                VStack(alignment: .leading){
                    Text("角色作品:")
                        .font(.title3)
                    
                    TextField("输入例如：东方Project", text: $workName)
                        .font(.title2)
                        .bold()
                }
            }.cornerRadius(25)
            
            GroupBox(){
                VStack(alignment: .leading){
                    Text("角色参考图片：")
                        .font(.title3)
                    PhotosSelector()
                }
            }
            .font(.title3)
            .cornerRadius(25)
            
            
            Text("第1步，共3步")
                .font(.caption2)
        }
        .padding()
        .navigationTitle("添加新的展出计划")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            
//            ToolbarItem(placement: .topBarTrailing) {
//                NavigationLink("下一步", destination: PickDateView())
//                .fontWeight(.bold)
//            }// 右上角下一步按钮
            
            ToolbarItem(placement: .topBarLeading) {
                Button("取消") {
                    showConfirmDialog = true // 关闭弹窗
                }.confirmationDialog("放弃修改？", isPresented: $showConfirmDialog) {
                    Button("是的，放弃", role: .destructive) {
                        dismiss()
                    }
                    Button("继续编辑", role: .cancel) {
                        // 什么都不做
                    }
                } message: {
                    Text("未保存的内容将丢失。")
                }
                .fontWeight(.bold)
            }//关闭提示按钮
            ToolbarItem(placement: .topBarTrailing) {
                Button("保存"){
                    let eventinfo = CosplayEvent(
                        roleName: roleName, workName: workName
                    )
                    modelContext.insert(eventinfo);
                    
                    do {
                        try modelContext.save()
                        print("✅ 保存成功")
                        print("✅ 准备保存: \(eventinfo.roleName) - \(eventinfo.workName)")
                        dismiss()
                    } catch {
                        print("❌ 失败: \(error)")
                    }
                }
                .fontWeight(.bold)
            }
        }
    }
}

//struct PickDateView: View {
//    var body: some View {
//        VStack {
//            Text("这是 Sheet 的第二页")
//        }
//        .navigationTitle("第二页标题")
//        .toolbar {
//            ToolbarItem(placement: .topBarTrailing) {
//                Button("保存"){
//                    let eventinfo = CosplayEvent(
////                        roleName: roleName, workName: <#T##String#>, imageData: <#T##Data?#>, eventDate: <#T##Date#>
//                    )
//                    modelContext.insert(eventinfo)
//                }
//                .fontWeight(.bold)
//            }
//        }
//    }
//}





#Preview {
    AddNewEventView()
        .modelContainer(for:CosplayEvent.self)
}
