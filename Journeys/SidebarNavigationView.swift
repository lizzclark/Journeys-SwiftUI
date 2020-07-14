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
                        Label("Discover", systemImage: "airplane.circle.fill")
                    })
                NavigationLink(
                    destination: PicksView(),
                    label: {
                        Label("Picks", systemImage: "star.fill")
                    })
                NavigationLink(
                    destination: MapView(),
                    label: {
                        Label("Map", systemImage: "map.fill")
                    })
                NavigationLink(
                    destination: TipsView(),
                    label: {
                        Label("Tips", systemImage: "list.bullet")
                    })
            }
            .navigationTitle("Journeys")
            .listStyle(SidebarListStyle())
        }
    }
}
