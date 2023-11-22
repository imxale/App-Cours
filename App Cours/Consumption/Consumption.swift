//
//  Consumption.swift
//  App Cours
//
//  Created by Axel Blanchard on 22/11/2023.
//

import Foundation

class Consumption: Identifiable {
    var id = UUID()
    var beer: Beer
    var quantity: Float
    
    init(id: UUID = UUID(), beer: Beer, quantity: Float) {
        self.id = id
        self.beer = beer
        self.quantity = quantity
    }
}
