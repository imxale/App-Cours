//
//  BeerCategory.swift
//  App Cours
//
//  Created by Axel Blanchard on 20/11/2023.
//

import Foundation

class BeerCategory: Hashable, Identifiable {
    var id = UUID()
    var name: String
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: BeerCategory, rhs: BeerCategory) -> Bool {
        return lhs.id == rhs.id
    }
}
