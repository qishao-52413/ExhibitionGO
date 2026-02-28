//
//  testui.swift
//  逛展GO
//
//  Created by 祁邵 on 2026/2/25.
//

import SwiftUI
import PhotosUI

struct PhotosSelector: View {
    @State var selectedItems: [PhotosPickerItem] = []
    @State var selectedImagePath: String?


    var body: some View {
        GroupBox{
        PhotosPicker(selection: $selectedItems,
                     matching: .images) {
            VStack(alignment:.center){
                Group{
                    Image(systemName: "camera")
                    Text("选择角色参考图片")
                        .cornerRadius(25)
                        .frame(maxWidth: .infinity,maxHeight: .greatestFiniteMagnitude)
                    }
                }
            }
        }
    }
}

#Preview {
    PhotosSelector()
}
