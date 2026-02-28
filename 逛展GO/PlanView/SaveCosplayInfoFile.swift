//
//  SaveCosplayInfoFile.swift
//  逛展GO
//
//  Created by 祁邵 on 2026/2/28.
//







// 假设你在 View 中注入了环境变量

//func saveToDisk() {
//    // 1. 创建对象
//    let newRecord = MyRecord(text: inputText, image: selectedImage)
//    
//    // 2. 插入上下文
//    modelContext.insert(newRecord)
//    
//    // 3. 永久写入磁盘
//    do {
//        try modelContext.save()
//        print("✅ 保存成功")
//    } catch {
//        print("❌ 失败: \(error)")
//    }
//}
//
//@Query(sort: \MyRecord.createTime, order: .reverse) private var records: [MyRecord]
//
//var body: some View {
//    List(records) { item in
//        VStack(alignment: .leading) {
//            Text(item.text)
//            Text(item.createTime, style: .date)
//            
//            // 如果有图片，转回 UIImage 显示
//            if let data = item.imageData, let uiImage = UIImage(data: data) {
//                Image(uiImage: uiImage)
//                    .resizable()
//                    .frame(height: 100)
//            }
//        }
//    }
//}
