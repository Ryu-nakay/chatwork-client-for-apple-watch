//
//  TokenInputViewState.swift
//  ChatworkClientForAppleWatch
//
//  Created by cw-ryu.nakayama on 2023/07/04.
//

import Combine
import Foundation
import SwiftChatworkAPI

@MainActor
final class TokenInputViewState: ObservableObject {
    init() {

    }
    
    private var watchConnector = WatchConnector()
    
    @Published var inputToken = ""
    
    func registerToken() {
        watchConnector.registerToken(inputToken: inputToken)
    }
}
