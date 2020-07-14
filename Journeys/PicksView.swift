//
//  PicksView.swift
//  Journeys
//
//  Created by Paul Hudson on 06/07/2020.
//

import SwiftUI

struct PicksView: View {
    @EnvironmentObject var locations: Locations
    
    let layout: [GridItem] = Array.init(repeating: GridItem(.adaptive(minimum: 150)), count: 3)
    
    var body: some View {
        /* Here is a section we added */

        ScrollView {
            GeometryReader { geo in
                TabView {
                    ForEach(1..<8) { i in
                        Image("photo\(i)")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: geo.size.width)
                            .clipped()
                    }
                }
            }
            .frame(height: 250)
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
                LazyVGrid(columns: layout) {
                    ForEach(locations.places, id: \.id) { location in
                        NavigationLink(destination: DiscoverView(location: location), label: {
                            Image(location.heroPicture)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 125)
                                .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                .overlay(
                                    Text(location.name)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                )
                        })
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding([.horizontal, .top], 16)
                .padding(.bottom, 50)
        }
        .navigationTitle("Our Top Picks")
        
        /* ends */
    }
}

struct PicksView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PicksView()
        }
        .environmentObject(Locations())
    }
}
