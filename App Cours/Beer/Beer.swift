//
//  Beer.swift
//  App Cours
//
//  Created by Axel Blanchard on 20/11/2023.
//

import Foundation
import Combine

class Beer: Hashable, Identifiable {
    var id = UUID()
    var name: String
    var description: String = ""
    var style: BeerStyles
    var category: BeerCategory
//    var style: String
//    var category: String
    var abv: Float
    var ibu: Float
    var photo: URL?
    var created_by: User
    var approve_by: User?
    var update_by: User?
//    var created_by: Int
//    var approve_by: Int?
    var createdAt: Date
    var updatedAt: Date?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Beer, rhs: Beer) -> Bool {
        return lhs.id == rhs.id
    }
    
    init(id: UUID = UUID(), name: String, description: String, style: BeerStyles, category: BeerCategory, abv: Float, ibu: Float, photo: URL? = nil, created_by: User, approve_by: User? = nil, update_by: User? = nil, createdAt: Date, updatedAt: Date? = nil) {
        self.id = id
        self.name = name
        self.description = description
        self.style = style
        self.category = category
        self.abv = abv
        self.ibu = ibu
        self.photo = photo
        self.created_by = created_by
        self.approve_by = approve_by
        self.update_by = update_by
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
    
    func formatedIBU() -> String {
        let formattedFloat = String(format: "%.1f", self.ibu)
        return formattedFloat
    }
    
    func formatedABV() -> String {
        let formattedFloat = String(format: "%.1f", self.abv)
        return formattedFloat
    }
}

class BeerListViewModel: ObservableObject {
    @Published var listBeers = [Beer]()
    
//    private var cancellables: Set<AnyCancellable> = []
//
//    init() {
//        $listBeers
//            .receive(on: DispatchQueue.main)
//            .sink { _ in self.objectWillChange.send() }
//            .store(in: &cancellables)
//    }
    
    func updateBeer(_ beer: Beer) {
        if let index = listBeers.firstIndex(where: { $0.id == beer.id }) {
            listBeers[index] = beer
            objectWillChange.send()
        }
        print(listBeers[0].name)
    }
    
    func addBeer(_ newBeer: Beer) {
        listBeers.append(newBeer)
        objectWillChange.send()
    }
}
