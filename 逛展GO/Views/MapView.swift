//
//  MapView.swift
//  逛展GO！
//
//  Created by 祁邵 on 2026/2/24.
//

import SwiftUI

struct MapView: View {
    var body: some View {
        ZStack{
            VStack {
                Text("这是一个帮助记录逛展日程的小帮手")
                    .font(.system(size: 30))
                Spacer()
                
                Button(action: {
                })
                {
                    Text("tap me")
                        .background(Color.green)
                        .cornerRadius(20)
                        .font(.system(size: 40))
                }
                
                
            }
        }.toolbar {
            ToolbarItem (placement: .topBarTrailing){
                Button {
                    
                }label: {
                    Image(systemName: "magnifyingglass.circle.fill")
                        .foregroundStyle(Color.red)
                    Text("查找")
                }
            }
        }
        .navigationTitle("home")
        .navigationBarTitleDisplayMode(.automatic)
        
        
        
    }
}

