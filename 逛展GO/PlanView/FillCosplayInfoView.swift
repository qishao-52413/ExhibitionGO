//
//  FillCosplayInfoView.swift
//  逛展GO
//
//  Created by 祁邵 on 2026/2/27.
//

import SwiftUI

struct FillCosplayInfoView: View {
    
    @State private var isNexton = false
    @State private var showConfirmDialog = false
    @Environment(\.dismiss) private var dismiss
    @State var cosplayName = ""
    @State var workName = ""
    
    var body: some View {
        VStack(spacing: 20) {
            GroupBox(){
                VStack(alignment: .leading){
                    Text("角色名称:")
                        .font(.title3)
                    
                    TextField("输入例如：十六夜咲夜", text: $cosplayName)
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
        }
        .padding()
        .navigationTitle("添加新的展出计划")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            // 右上角关闭按钮
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("下一步", destination: PickDateView())
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
    }
}


#Preview {
    FillCosplayInfoView()
}
