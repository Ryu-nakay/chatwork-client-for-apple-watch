//
//  WatchConnector.swift
//  ChatworkClientForAppleWatch
//
//  Created by cw-ryu.nakayama on 2023/07/01.
//

import Foundation
import WatchConnectivity
import SwiftChatworkAPI

class WatchConnector: NSObject, ObservableObject, WCSessionDelegate {
    
    @Published var receivedMessage = "WATCH: 未受信"
    @Published var count = 0
    
    @Published var inputToken = ""
    @Published var apiToken: APIToken?
    
    override init() {
        super.init()
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
    }
    
    func session(
        _ session: WCSession,
        activationDidCompleteWith activationState: WCSessionActivationState,
        error: Error?
    ) {
        print("activationDidCompleteWith state= \(activationState.rawValue)")
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("sessionDidBecomeInactive")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("sessionDidDeactivate")
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        print("didReceiveMessage: \(message)")
        
        DispatchQueue.main.async {
            self.receivedMessage = "WATCH : \(message["WATCH_COUNT"] as! Int)"
            self.count = message["WATCH_COUNT"] as! Int
        }
    }
    
    func send() {
        if WCSession.default.isReachable {
            count += 1
            WCSession.default.sendMessage(["PHONE_COUNT" : count], replyHandler: nil)
        }
    }
    
    func registerToken() {
        if WCSession.default.isReachable {
            if let apiToken = try? APIToken(value: inputToken) {
                self.apiToken = apiToken
                WCSession.default.sendMessage(["TOKEN_EXIST" : apiToken.value], replyHandler: nil)
            }
        }
    }
}
