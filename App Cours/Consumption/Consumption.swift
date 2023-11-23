//
//  Consumption.swift
//  App Cours
//
//  Created by Axel Blanchard on 22/11/2023.
//

import Foundation
import Combine

class Consumption: Identifiable {
    var id = UUID()
    var beer: Beer
    var quantity: Float
    var address: String
    
    init(id: UUID = UUID(), beer: Beer, quantity: Float, address: String) {
        self.id = id
        self.beer = beer
        self.quantity = quantity
        self.address = address
    }
}

class ConsumptionListViewModel: ObservableObject {
    @Published var consumptions: [Consumption] = []
    @Published var isAdding: Bool = false

//    var beerListViewModel: BeerListViewModel    

//    private var cancellables: Set<AnyCancellable> = []
//
//    init(beerListViewModel: BeerListViewModel) {
//        self.beerListViewModel = beerListViewModel
//
//        beerListViewModel.$listBeers
//            .sink { [weak self] _ in
//                self?.objectWillChange.send()
//            }
//            .store(in: &cancellables)
//    }

    func addConsumption(_ consumption: Consumption) {
        consumptions.append(consumption)
    }

    func updateConsumption(_ updatedConsumption: Consumption) {
        if let index = consumptions.firstIndex(where: { $0.id == updatedConsumption.id }) {
            consumptions[index] = updatedConsumption
        }
    }
}
