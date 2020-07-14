//
//  MapView.swift
//  Journeys
//
//  Created by Lizz Clark on 13/07/2020.
//

import MapKit
import Foundation
import SwiftUI

/* this entire view was added */

struct MapView: View {
    @EnvironmentObject var locations: Locations
    @ScaledMetric var annotationSize: CGFloat = 80
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: .init(latitude: 51.507222, longitude: -0.1275), span: .init(latitudeDelta: 40, longitudeDelta: 40))
        
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations.places) { location in
            MapAnnotation(coordinate: location.coordinate) {
                NavigationLink(destination: DiscoverView(location: location)) {
                    Image(location.country)
                        .renderingMode(.original)
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(Color.blue, lineWidth: 4)
                        )
                        .frame(width: max(80, annotationSize), height: max(40, annotationSize / 2))
                }
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
