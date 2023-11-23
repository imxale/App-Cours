//
//  Restaurant.swift
//  App Cours
//
//  Created by Axel Blanchard on 23/11/2023.
//

import Foundation

struct Restaurant: Hashable, Identifiable, Codable {
    var id: UUID
    var name: String
    var address: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Restaurant, rhs: Restaurant) -> Bool {
        return lhs.id == rhs.id
    }
}
