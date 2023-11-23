//
//  BeerFormEdit.swift
//  App Cours
//
//  Created by Axel Blanchard on 21/11/2023.
//

import SwiftUI

struct BeerFormEdit: View {
    
    @Binding var editBeer:Bool
    @Binding var showingPopup:Bool

    let addBeerStyles:[BeerStyles]
    
    let addBeerCategories:[BeerCategory]
    
    @Binding var listBeers:[Beer]
    
    @State var beer:Beer
//    @State var idBeer:UUID
    
    var body: some View {
        VStack {
            Text("Edit \(beer.name)")
                .font(.title)
            Form {
                Section(header: Text("Beer Information")) {
                    TextField("Beer name", text: $beer.name)
                    TextField("Beer description", text: $beer.description)
                    Picker("Style", selection: $beer.style) {
                        ForEach(addBeerStyles, id: \.self) { style in
                            Text(style.name)
                        }
                    }
                    Picker("Category", selection: $beer.category) {
                        ForEach(addBeerCategories, id: \.self) { category in
                            Text(category.name)
                        }
                    }
                    TextField("ABV", value:$beer.abv, format:.number)
                    TextField("IBU", value:$beer.ibu, format:.number)
                    TextField("Photo url", value: $beer.photo, format: .url)
                }
                Section {
                    Button("Save") {
                        if !beer.name.isEmpty
                            && !addBeerStyles.isEmpty
                            && !addBeerCategories.isEmpty
                            && beer.abv != 0
                            && beer.ibu != 0
                            && beer.photo != nil {
//                            listBeers.append(beer)
                            if let index = listBeers.firstIndex(where: { $0.id == beer.id }) {
                                listBeers[index] = beer
                            }
                            
                            self.editBeer.toggle()
                        } else {
                            showingPopup = true
                        }
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
