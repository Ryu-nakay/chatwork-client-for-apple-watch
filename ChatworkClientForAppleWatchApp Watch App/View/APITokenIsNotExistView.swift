//
//  APITokenIsNotExistView.swift
//  ChatworkClientForAppleWatchApp Watch App
//
//  Created by cw-ryu.nakayama on 2023/07/03.
//

import SwiftUI

struct APITokenIsNotExistView: View {
    var body: some View {
        VStack {
            Text("API Tokenが存在しません")
                .font(.title3)
                .padding(.bottom, 20)
            Text("iPhone上のアプリから設定してください")
        }
        .padding()
    }
}

struct APITokenIsNotExistView_Previews: PreviewProvider {
    static var previews: some View {
        APITokenIsNotExistView()
    }
}
