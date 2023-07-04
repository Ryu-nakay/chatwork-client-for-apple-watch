//
//  TokenStore.swift
//  ChatworkClientForAppleWatchApp Watch App
//
//  Created by cw-ryu.nakayama on 2023/07/03.
//

import SwiftChatworkAPI
import Foundation

@MainActor
final class TokenStore {
    public static let shared: TokenStore = .init()
    
    @Published private(set) var value: APIToken? = APITokenManager().load() {
        didSet {
            if oldValue == nil && value != nil {
                APITokenManager().save(tokenData: value!)
            }
        }
    }
    
    func setToken(apiToken: APIToken) {
        self.value = apiToken
        try? ChatworkAPI.shared.registerToken(token: apiToken.value)
    }
}
