//
//  BeerCategory.swift
//  App Cours
//
//  Created by Axel Blanchard on 20/11/2023.
//

import Foundation

class BeerCategory: Identifiable {
    var id = UUID()
    var name: String
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}
