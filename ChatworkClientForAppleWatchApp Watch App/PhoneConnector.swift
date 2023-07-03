//
//  PhoneConnector.swift
//  ChatworkClientForAppleWatchApp Watch App
//
//  Created by cw-ryu.nakayama on 2023/07/01.
//

import Foundation
import WatchConnectivity
import SwiftChatworkAPI

class PhoneConnector: NSObject, ObservableObject, WCSessionDelegate {
    override init() {
        super.init()
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("activationDidCompleteWith state= \(activationState.rawValue)")
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("didReceiveMessage: \(message)")
                
        DispatchQueue.main.async {
            if let receiveToken = try? APIToken(value: message["TOKEN_EXIST"] as! String) {
                TokenStore.shared.setToken(apiToken: receiveToken)
            }
            
        }
    }
}
