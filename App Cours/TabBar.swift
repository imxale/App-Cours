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
            Home()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            BeerTableView()
                .tabItem {
                    Label("Beer", systemImage: "list.bullet.rectangle.portrait")
                }
            
            ConsumptionAdd()
                .tabItem {
                    Label("", systemImage: "plus.circle.fill")
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
