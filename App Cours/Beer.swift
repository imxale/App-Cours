//
//  Beer.swift
//  App Cours
//
//  Created by Axel Blanchard on 20/11/2023.
//

import Foundation

struct Beer {
//    var id: Int
    var name: String
    var description: String?
    var style: BeerStyles
    var category: BeerCategory
    var abv: Float
    var ibu: Float
    var image: URL
    var created_by: User
    var approve_by: User?
    var update_by: User?
    var createdAt: Date
    var updatedAt: Date
}
