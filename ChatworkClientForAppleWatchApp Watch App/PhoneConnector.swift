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
    @Published var receivedMessage = "PHONE : 未受信"
    @Published var count = 0
    
    @Published var apiToken: APIToken?
    
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
                self.apiToken = receiveToken
            }
            
        }
    }
    
    func send() {
        if WCSession.default.isReachable {
            count += 1
            WCSession.default.sendMessage(["WATCH_COUNT": count], replyHandler: nil) {
                error in
                print(error)
            }
        }
    }
}
