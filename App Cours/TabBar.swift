//
//  TabBar.swift
//  App Cours
//
//  Created by Axel Blanchard on 21/11/2023.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            BeerTableView()
                .tabItem {
                    Label("Beer", systemImage: "list.bullet.rectangle.portrait")
                }
            
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            UserProfilView()
                .tabItem {
                    Label("Profil", systemImage: "person.crop.circle")
                }
        }
    }
}

//#Preview {
//    TabBar()
//}
