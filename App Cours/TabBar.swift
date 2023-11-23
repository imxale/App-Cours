//
//  TabBar.swift
//  App Cours
//
//  Created by Axel Blanchard on 21/11/2023.
//

import SwiftUI

struct TabBar: View {
    @ObservedObject private var beerListViewModel = BeerListViewModel()

    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            BeerTableView(beerListViewModel: beerListViewModel)
                .tabItem {
                    Label("Beer", systemImage: "list.bullet.rectangle.portrait")
                }
            
            ConsumptionListView(consumptionListViewModel: ConsumptionListViewModel(), beerListViewModel: beerListViewModel)
                .tabItem {
                    Label("Consumption", systemImage: "plus.circle.fill")
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
