//
//  SandboxListView.swift
//  SDKSandbox
//
//  Created by Yuto Hayashi on 2026/06/10.
//

import SwiftUI

public struct SandboxListView: View {
    @Environment(\.dismiss) private var dismiss

    let items: [String]

    public init(items: [String]) {
        self.items = items
    }

    public var body: some View {
        NavigationStack {
            List(items, id: \.self) { item in
                Text(item)
            }
            .navigationTitle("リスト")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
}

#Preview {
    SandboxListView(items: ["アイテム1", "アイテム2", "アイテム3"])
}
