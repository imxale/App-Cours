//
//  Beer.swift
//  App Cours
//
//  Created by Axel Blanchard on 20/11/2023.
//

import Foundation

struct Beer: Identifiable {
    var id = UUID()
    var name: String
    var description: String?
    var style: BeerStyles
    var category: BeerCategory
//    var style: String
//    var category: String
    var abv: Float
    var ibu: Float
    var photo: URL
    var created_by: User
    var approve_by: User?
    var update_by: User?
//    var created_by: Int
//    var approve_by: Int?
    var createdAt: Date
    var updatedAt: Date?
}

func formatedFloat(value: Float) -> String {
    let formattedFloat = String(format: "%.1f", value)
    return formattedFloat
}
