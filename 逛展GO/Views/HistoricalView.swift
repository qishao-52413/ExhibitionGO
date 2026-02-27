//
//  HistoricalView.swift
//  逛展GO！
//
//  Created by 祁邵 on 2026/2/24.
//

import SwiftUI

struct HistoricalView: View {
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack (spacing:20){
                    
                }
                .padding(.vertical)
            }
            .navigationTitle("参展历史")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItem (placement: .topBarTrailing){
                    Button {
                        
                    }label: {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(Color.red)
                        Text("查找")
                    }
                }
                ToolbarItem(placement:.topBarLeading){
                    Menu {
                        Button("刷新"){
                            print("刷新")
                        }
                        Button("排序") {
                            print("排序")
                        }
                    } label: {
                        HStack(spacing:4){
                            Image(systemName: "person.crop.circle.fill")
                            Text("角色")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HistoricalView()
}
