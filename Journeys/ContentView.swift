//
//  ContentView.swift
//  Journeys
//
//  Created by Paul Hudson on 06/07/2020.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var locations: Locations

    var body: some View {
        TabView {
            DiscoverView(location: locations.primary)
                .tabItem {
                    Image(systemName: "airplane.circle.fill")
                        .imageScale(.large)
                    Text("Discover")
                }

            NavigationView {
                PicksView()
            }
            .tabItem {
                Image(systemName: "star.fill")
                    .imageScale(.large)
                Text("Picks")
            }
            
            NavigationView {
                MapView()
            }
            .tabItem {
                Image(systemName: "map.fill")
                    .imageScale(.large)
                Text("Map")
            }

            NavigationView {
                TipsView()
            }
            .tabItem {
                Image(systemName: "list.bullet")
                    .imageScale(.large)
                Text("Tips")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
