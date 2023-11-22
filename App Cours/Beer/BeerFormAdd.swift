//
//  BeerFormAdd.swift
//  App Cours
//
//  Created by Axel Blanchard on 21/11/2023.
//

import SwiftUI

struct BeerFormAdd: View {
    
    @Binding var addBeer:Bool
    @Binding var showingPopup:Bool

    @Binding var addBeerName:String?
//    private var addBeerDescription:String?
    
//    private var selectedBeerStyle:BeerStyles
    let addBeerStyles:[BeerStyles]
    
//    private var selectedBeerCategory:BeerCategory
    let addBeerCategories:[BeerCategory]
    
//    private var addBeerABV:Float
//    private var addBeerIBU:Float
    
//    private var addBeerURL:URL!
    
//    private var addBeerCreated_by:User
    
//    private var addBeerCreatedAt:Date
    
    var listBeers:[Beer]
    
//    let beer:Beer?
    
    init(addBeer: Bool, showingPopup: Bool, addBeerName: String? = nil, addBeerStyles: [BeerStyles], addBeerCategories: [BeerCategory], listBeers: [Beer]) {
        self.addBeer = addBeer
        self.showingPopup = showingPopup
        self.addBeerName = addBeerName
        self.addBeerStyles = addBeerStyles
        self.addBeerCategories = addBeerCategories
        self.listBeers = listBeers
    }
    
    var body: some View {
        VStack {
            Text("Add a beer")
                .font(.title)
            Form {
                Section(header: Text("Beer Information")) {
                    TextField("Beer name", text: $addBeerName)
//                    TextField("Beer description", text: addBeerDescription)
//                    Picker("Style", selection: selectedBeerStyle.name) {
//                        ForEach(addBeerStyles) {
//                            Text($0.name)
//                        }
//                    }
//                    Picker("Category", selection: selectedBeerCategory.name) {
//                        ForEach(addBeerCategories) {
//                            Text($0.name)
//                        }
//                    }
//                    TextField("ABV", value:addBeerABV, format:.number)
//                    TextField("IBU", value:addBeerIBU, format:.number)
//                    TextField("Photo url", value: addBeerURL, format: .url)
                }
                Section {
                    Button("Save") {
//                        if !addBeerName.isEmpty
//                            && !addBeerDescription.isEmpty
//                            && !addBeerStyles.isEmpty
//                            && !addBeerCategories.isEmpty
//                            && addBeerABV != 0
//                            && addBeerIBU != 0
//                            && addBeerURL != nil {
//                            listBeers.append(
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
//                            
//                            self.addBeer.toggle()
//                            
//                            // Reset Values
//                            self.addBeerName = ""
//                            self.addBeerDescription = ""
//                            self.addBeerABV = Float()
//                            self.addBeerIBU = Float()
//                            self.addBeerURL = URL(string: "")
//                        } else {
//                            showingPopup.toggle()
//                        }
                    }
//                    .alert("Error", isPresented: $showingPopup) {
//                        showingPopup.toggle()
//                    }
                }
            }
            .cornerRadius(10)
        }
        .padding(20)
    }
}

//#Preview {
//    BeerAdd()
//}
