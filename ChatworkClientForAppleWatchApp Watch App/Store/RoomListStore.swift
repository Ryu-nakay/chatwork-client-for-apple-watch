//
//  RoomListStore.swift
//  ChatworkClientForAppleWatchApp Watch App
//
//  Created by cw-ryu.nakayama on 2023/07/03.
//

import Foundation
import SwiftChatworkAPI

@MainActor
final class RoomListStore {
    static let shared: RoomListStore = .init()
    
    @Published private(set) var value: RoomList?
    
    func fetch() async throws {
        let response = try await ChatworkAPI.shared.rooms.get()
        value = RoomList.comvert(from: response)
    }
}
