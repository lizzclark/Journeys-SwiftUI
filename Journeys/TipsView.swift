//
//  TipsView.swift
//  Journeys
//
//  Created by Paul Hudson on 06/07/2020.
//

import SwiftUI

struct Tip: Decodable, Identifiable {
    enum CodingKeys: CodingKey {
        case title, body
    }

    let id = UUID()
    let title: String
    let body: String
}

struct ListItem: Identifiable {
    let id: UUID
    let title: String
    let children: [ListItem]?
}

struct TipsView: View {
    let tips = Bundle.main.decode([Tip].self, from: "tips.json")
    
    var listItems: [ListItem] {
        return tips.map { tip in
            return ListItem(id: tip.id, title: tip.title, children: [ListItem(id: UUID(), title: tip.body, children: nil)])
        }
    }

    var body: some View {
        List(listItems, children: \.children) { item in
            VStack(alignment: .leading) {
                Text(item.title)
            }
            .padding(.vertical)
        }
        .navigationTitle("Tips")
    }
}

struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        PicksView()
    }
}
