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
        NavigationView {
            VStack {
                Button {
                    Task {
                        await state.fetch()
                    }
                } label: {
                    Image(systemName: "goforward")
                }
                
                if state.roomList != nil {
                    List {
                        ForEach(state.roomList!.body, id: \.roomId) { roomObject in
                            NavigationLink(destination: RoomView()) {
                                HStack {
                                    Image(systemName: "circle")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20)
                                    Text(roomObject.name)
                                }
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .task {
                await state.fetch()
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
    
    func fetch() async {
        try? await RoomListStore.shared.fetch()
    }
}

struct RoomListView_Previews: PreviewProvider {
    static var previews: some View {
        RoomListView()
    }
}
