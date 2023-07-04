//
//  RoomList.swift
//  ChatworkClientForAppleWatchApp Watch App
//
//  Created by cw-ryu.nakayama on 2023/07/03.
//

import SwiftChatworkAPI
import Foundation

struct RoomList {
    let body: [RoomObject]
    
    struct RoomObject {
        
        public let roomId: Int
        public let name: String
        public let type: String
        public let role: String
        public let sticky: Bool
        public let unreadNum: Int
        public let mentionNum: Int
        public let mytaskNum: Int
        public let messageNum: Int
        public let fileNum: Int
        public let taskNum: Int
        public let iconPath: String
        public let lastUpdateTime: Int
        
        static func comvert(from: RoomsPath.Room) -> RoomObject {
            RoomObject(
                roomId: from.roomId,
                name: from.name,
                type: from.type,
                role: from.role,
                sticky: from.sticky,
                unreadNum: from.unreadNum,
                mentionNum: from.mentionNum,
                mytaskNum: from.mytaskNum,
                messageNum: from.messageNum,
                fileNum: from.fileNum,
                taskNum: from.taskNum,
                iconPath: from.iconPath,
                lastUpdateTime: from.lastUpdateTime
            )
        }
    }
    
    public static func comvert(from: RoomsPath.GetResponse) -> RoomList {
        RoomList(
            body: from.body.map({ room in
                RoomObject.comvert(from: room)
            })
        )
    }
}
