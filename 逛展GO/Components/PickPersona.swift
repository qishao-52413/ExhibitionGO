//
//  PickPersona.swift
//  逛展GO
//
//  Created by 祁邵 on 2026/2/27.
//

import SwiftUI


        struct ConfirmEraseItems: View {
            @State private var isShowingSheet = false
            var body: some View {
                Button("Show Action Sheet", action: {
                    isShowingSheet = true
                })
                .actionSheet(isPresented: $isShowingSheet) {
                    ActionSheet(
                        title: Text("Permanently erase the items in the Trash?"),
                        message: Text("You can't undo this action."),
                        buttons:[
                            .destructive(Text("Empty Trash"),
                                         action: emptyTrashAction),
                            .cancel()
                        ]
                    )}
            }

            func emptyTrashAction() {
                // Handle empty trash action.
            }
        }

#Preview {
    ConfirmEraseItems()
}
