//
//  SandboxButton.swift
//  SDKSandbox
//
//  Created by Yuto Hayashi on 2026/06/10.
//

import SwiftUI

public struct SandboxButton: View {
    let title: String
    let action: () -> Void

    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.accentColor)
                )
        }
        .buttonStyle(.plain)
        .padding(.horizontal, 16)
    }
}

#if os(iOS)
#Preview {
    // プレビュー内だけで使う「画面が開いているか」の状態
    @Previewable @State var isPresented = false

    VStack {
        // SDKのボタンを表示
        SandboxButton(title: "SDKの全画面Viewを開く") {
            isPresented = true
        }
    }
    // ボタンが押されたら、同じSDK内の SandboxFullModalView を表示する
    .fullScreenCover(isPresented: $isPresented) {
        SandboxListView(items: ["テスト1", "テスト2", "テスト3"])
    }
}
#endif
