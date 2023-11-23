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

    @State var addBeerName:String = ""
    @State var addBeerDescription:String = ""
    
    let addBeerStyles:[BeerStyles]
    @State var selectedBeerStyle:BeerStyles
    
    let addBeerCategories:[BeerCategory]
    @State var selectedBeerCategory: BeerCategory
    
    @State var addBeerABV:Float = 0
    @State var addBeerIBU:Float = 0
    
    @State var addBeerURL:URL! = URL(string:"https://biereratz.fr/wp-content/uploads/2022/08/RATZ-BL33.png.webp")
    
    @Binding var addBeerCreated_by:User
    
    @State var addBeerCreatedAt:Date = Date()
    
    @Binding var listBeers:[Beer]
    
    var body: some View {
        VStack {
            Text("Add a beer")
                .font(.title)
            Form {
                Section(header: Text("Beer Information")) {
                    TextField("Beer name", text: $addBeerName)
                    TextField("Beer description", text: $addBeerDescription)
                    Picker("Style", selection: $selectedBeerStyle) {
                        ForEach(addBeerStyles, id: \.self) { style in
                            Text(style.name)
                                .tag(style)
                        }
                    }
                    Picker("Category", selection: $selectedBeerCategory) {
                        ForEach(addBeerCategories, id: \.id) { category in
                            Text(category.name)
                                .tag(category)
                        }
                    }
                    TextField("ABV", value:$addBeerABV, format:.number)
                    TextField("IBU", value:$addBeerIBU, format:.number)
                    TextField("Photo url", value: $addBeerURL, format: .url)
                }
                Section {
                    Button("Save") {
//                        print($selectedBeerStyle.name)
                        if !addBeerName.isEmpty
                            && !addBeerStyles.isEmpty
                            && !addBeerCategories.isEmpty
                            && addBeerABV != 0
                            && addBeerIBU != 0
                            && addBeerURL != nil {
                            listBeers.append(
                                Beer(
                                    name: addBeerName,
                                    description: addBeerDescription,
                                    style: selectedBeerStyle,
                                    category: selectedBeerCategory,
                                    abv: addBeerABV,
                                    ibu: addBeerIBU,
                                    photo: addBeerURL,
                                    created_by: addBeerCreated_by,
                                    createdAt: addBeerCreatedAt
                                )
                            )
                            
                            self.addBeer.toggle()
//                            
//                            // Reset Values
//                            self.addBeerName = ""
//                            self.addBeerDescription = ""
//                            self.addBeerABV = Float()
//                            self.addBeerIBU = Float()
//                            self.addBeerURL = URL(string: "")
                        } else {
//                            showingPopup.toggle()
                            Alert(title: Text("Error"))
                        }
                    }
                }
            }
            .cornerRadius(10)
        }
        .padding(20)
    }
}
