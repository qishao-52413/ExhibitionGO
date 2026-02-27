//
//  SettingView.swift
//  逛展GO！
//
//  Created by 祁邵 on 2026/2/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
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
                Text("233")
                PhotosSelector()
                
            }
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
}
