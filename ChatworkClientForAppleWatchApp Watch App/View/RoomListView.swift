//
//  RoomListView.swift
//  ChatworkClientForAppleWatchApp Watch App
//
//  Created by cw-ryu.nakayama on 2023/07/03.
//

import SwiftUI

struct RoomListView: View {
    @StateObject var state = RoomListViewState()
    
    var body: some View {
        VStack {
            Button {
                Task {
                    try? await state.fetch()
                }
            } label: {
                Image(systemName: "goforward")
            }
            
            if state.roomList != nil {
                List {
                    ForEach(state.roomList!.body, id: \.roomId) { roomObject in
                        Text(roomObject.name)
                    }
                }
            }
        }

        
    }
}

@MainActor
final class RoomListViewState: ObservableObject {
    @Published private(set) var roomList: RoomList?
    
    init() {
        RoomListStore.shared.$value
            .assign(to: &$roomList)
    }
    
    func fetch() async throws {
        try? await RoomListStore.shared.fetch()
    }
}

struct RoomListView_Previews: PreviewProvider {
    static var previews: some View {
        RoomListView()
    }
}
