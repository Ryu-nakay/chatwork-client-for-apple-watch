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
    }
    
    func registerToken(inputToken: String) {
        if WCSession.default.isReachable {
            if let apiToken = try? APIToken(value: inputToken) {
                WCSession.default.sendMessage(["TOKEN_EXIST" : apiToken.value], replyHandler: nil)
            }
        }
    }
}
