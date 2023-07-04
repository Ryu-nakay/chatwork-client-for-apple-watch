//
//  TokenInputView.swift
//  ChatworkClientForAppleWatch
//
//  Created by cw-ryu.nakayama on 2023/07/01.
//

import SwiftUI

struct TokenInputView: View {
    @StateObject var state = TokenInputViewState()
    
    var body: some View {
        VStack {
            Text("Chatwork API Tokenを入力")
            
            TextField("token", text: $state.inputToken)
                .textFieldStyle(.roundedBorder)
                .padding(20)
            
            Spacer()
                .frame(height: 80)
            
            Button {
                state.registerToken()
            } label: {
                Text("登録")
            }
        }
    }
}

struct TokenInputView_Previews: PreviewProvider {
    static var previews: some View {
        TokenInputView()
    }
}
