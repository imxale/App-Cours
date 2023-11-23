//
//  ConsumptionListView.swift
//  App Cours
//
//  Created by Axel Blanchard on 23/11/2023.
//

import SwiftUI

struct ConsumptionListView: View {
    @ObservedObject var consumptionListViewModel: ConsumptionListViewModel
    @ObservedObject var beerListViewModel: BeerListViewModel

    var body: some View {
        NavigationView {
            List(consumptionListViewModel.consumptions) { consumption in
                NavigationLink(destination: ConsumptionEditView(consumptionListViewModel: consumptionListViewModel, consumption: consumption)) {
                    Text("\(consumption.beer.name) - \(consumption.quantity) - \(consumption.address)")
                }
            }
            .navigationTitle("Consumptions")
            .navigationBarItems(trailing:
                Button(action: {
                    // Add action to navigate to the ConsumptionForm
                    consumptionListViewModel.isAdding = true
                }) {
                    Image(systemName: "plus")
                }
            )
        }
        .sheet(isPresented: $consumptionListViewModel.isAdding) {
            ConsumptionForm(consumptionListViewModel: consumptionListViewModel, beerListViewModel: beerListViewModel, isAdding: $consumptionListViewModel.isAdding)
        }
    }
}
