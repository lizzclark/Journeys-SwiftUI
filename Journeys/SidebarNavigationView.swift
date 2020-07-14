//
//  SidebarNavigationView.swift
//  Journeys
//
//  Created by Lizz Clark on 14/07/2020.
//

import Foundation
import SwiftUI

struct SidebarNavigationView: View {
    @EnvironmentObject var locations: Locations
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: DiscoverView(location: locations.primary),
                    label: {
                        Image(systemName: "airplane.circle.fill")
                            .imageScale(.large)
                        Text("Discover")
                    })
                NavigationLink(
                    destination: PicksView(),
                    label: {
                        Image(systemName: "star.fill")
                            .imageScale(.large)
                        Text("Picks")
                    })
                NavigationLink(
                    destination: MapView(),
                    label: {
                        Image(systemName: "map.fill")
                            .imageScale(.large)
                        Text("Map")
                    })
                NavigationLink(
                    destination: TipsView(),
                    label: {
                        Image(systemName: "list.bullet")
                            .imageScale(.large)
                        Text("Tips")
                    })
            }
            .navigationTitle("Journeys")
            .listStyle(SidebarListStyle())
        }
    }
}
