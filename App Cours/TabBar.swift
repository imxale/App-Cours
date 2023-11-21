//
//  TabBar.swift
//  App Cours
//
//  Created by Axel Blanchard on 21/11/2023.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        TabView {
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }

            BeerTableView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
    }
}

//#Preview {
//    TabBar()
//}
