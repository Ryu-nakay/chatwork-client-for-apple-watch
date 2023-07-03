//
//  ContentView.swift
//  ChatworkClientForAppleWatchApp Watch App
//
//  Created by cw-ryu.nakayama on 2023/07/01.
//

import SwiftUI
import Combine
import SwiftChatworkAPI

struct ContentView: View {
    @ObservedObject var phoneConnector = PhoneConnector()
    @StateObject var state = ViewState()
    
    var body: some View {
        ZStack {
            if state.token == nil {
                APITokenIsNotExistView()
            } else  {
                RoomListView()
            }
        }
    }
}

@MainActor
final class ViewState: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var token: APIToken?
    
    init() {
        TokenStore.shared.$value
            .assign(to: &$token)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
