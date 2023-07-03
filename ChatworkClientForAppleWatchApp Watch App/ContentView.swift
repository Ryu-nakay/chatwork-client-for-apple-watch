//
//  ContentView.swift
//  ChatworkClientForAppleWatchApp Watch App
//
//  Created by cw-ryu.nakayama on 2023/07/01.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var phoneConnector = PhoneConnector()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Text("\(phoneConnector.apiToken != nil ? "exist": "not" )")
            Button {
                phoneConnector.send()
            } label: {
                Text("Count")
            }

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
