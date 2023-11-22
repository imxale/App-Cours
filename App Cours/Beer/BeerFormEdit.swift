//
//  BeerFormEdit.swift
//  App Cours
//
//  Created by Axel Blanchard on 21/11/2023.
//

import SwiftUI

struct BeerFormEdit: View {
    
    var editBeer:Bool
    @Binding var showingPopup:Bool

    @Binding private var addBeerName:String?
    private var addBeerDescription:String?

    private var selectedBeerStyle:BeerStyles?
    let addBeerStyles:[BeerStyles]
    
    private var selectedBeerCategory:BeerCategory?
    let addBeerCategories:[BeerCategory]
    
    private var addBeerABV:Float?
    private var addBeerIBU:Float?
    
    private var addBeerURL:URL?
    
    private var addBeerCreated_by:User?
    
    private var addBeerCreatedAt:Date?
    
    private var listBeers:[Beer]
    
    let beer:Beer
    
    var body: some View {
        VStack {
            Text("Edit \(beer.name)")
                .font(.title)
            Form {
                Section(header: Text("Beer Information")) {
                    TextField("Beer name", text: $addBeerName)
//                    TextField("Beer description", text: beer.description)
//                    Picker("Style", selection: beer.style) {
//                        ForEach(addBeerStyles) {
//                            Text($0.name)
//                        }
//                    }
//                    Picker("Category", selection: beer.category) {
//                        ForEach(addBeerCategories) {
//                            Text($0.name)
//                        }
//                    }
//                    TextField("ABV", value:beer?.abv, format:.number)
//                    TextField("IBU", value:beer?.ibu, format:.number)
//                    TextField("Photo url", value: beer?.photo, format: .url)
                }
                Section {
                    Button("Save") {
//                        if !beer.name.isEmpty
//                            && ((beer.description?.isEmpty) == nil)
//                            && beer.abv != 0
//                            && beer.ibu != 0
//                            && beer.photo != nil {
//                            listBeers.append(
//                                beer
//                                Beer(
//                                    name: addBeerName,
//                                    description: addBeerDescription,
//                                    style: selectedBeerStyle,
//                                    category: selectedBeerCategory,
//                                    abv: addBeerABV,
//                                    ibu: addBeerIBU,
//                                    photo: addBeerURL,
//                                    created_by: addBeerCreated_by,
//                                    createdAt: addBeerCreatedAt
//                                )
//                            )
                            
//                            self.editBeer.toggle()
//                        } else {
//                            showingPopup = true
//                        }
                    }
                    .alert("Error", isPresented: $showingPopup) {
                        Text("ghghsfg")
                        Button("Ok", role:.cancel) {
                            
                        }
                    }
                }
            }
            .cornerRadius(10)
        }.padding(20)
    }
}
