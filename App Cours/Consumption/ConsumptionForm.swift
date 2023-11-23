//
//  ConsumptionAdd.swift
//  App Cours
//
//  Created by Axel Blanchard on 22/11/2023.
//

import SwiftUI

struct ConsumptionForm: View {
    
    @ObservedObject var consumptionListViewModel: ConsumptionListViewModel
    @ObservedObject var beerListViewModel: BeerListViewModel
    @Binding var isAdding: Bool

    @State var selectedBeer: Beer?
    @State var quantity: String = ""
    @State var selectedRestaurant: Restaurant?
    @State var restaurants: [Restaurant] = []
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select Beer", selection: $selectedBeer) {
                        ForEach(beerListViewModel.listBeers) { beer in
                            Text(beer.name).tag(beer as Beer?)
                        }
                    }
                    .onAppear {
                        print("List of beers: \(beerListViewModel.listBeers)")
                    }

                    TextField("Quantity", text: $quantity)
                        .keyboardType(.decimalPad)
                }

                Section {
                    Picker("Select Restaurant", selection: $selectedRestaurant) {
                        ForEach(restaurants) { restaurant in
                            Text("\(restaurant.name) - \(restaurant.address)").tag(restaurant as Restaurant?)
                        }
                    }
                    .onAppear { 
//                            restaurants = fetchData()
                    }
                }

                Section {
                    Button("Save") {
                        saveConsumption()
                    }
                }
            }
            .navigationTitle("Add Consumption")
        }
    }
    
    func saveConsumption() {
        guard let selectedBeer = selectedBeer,
              let quantityFloat = Float(quantity),
              let selectedRestaurant = selectedRestaurant else {
            return
        }

        let consumption = Consumption(beer: selectedBeer, quantity: quantityFloat, address: "\(selectedRestaurant.name) - \(selectedRestaurant.address)")
        consumptionListViewModel.addConsumption(consumption)
        isAdding = false
    }
    
    func fetchData() {
        guard let url = URL(string: "https://opendata.paris.fr/api/explore/v2.1/catalog/datasets/restaurants-casvp/records?limit=20") else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode([String: [Restaurant]].self, from: data)
                    self.restaurants = result["records"] ?? []
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            } else if let error = error {
                print("Error fetching data: \(error)")
            }
        }.resume()
    }
}
