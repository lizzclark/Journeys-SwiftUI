//
//  JourneysApp.swift
//  Journeys
//
//  Created by Paul Hudson on 06/07/2020.
//

import SwiftUI

@main
struct JourneysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Locations())
        }
    }
}

struct JourneysApp_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
    }
}
