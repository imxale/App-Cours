//
//  BeerView.swift
//  App Cours
//
//  Created by Axel Blanchard on 21/11/2023.
//

import SwiftUI

struct BeerTableView: View {
    
    @State var addBeer = false
    
    @State var addBeerName: String = ""
    @State var addBeerDescription: String = ""
    
    @State var addBeerStyles: [BeerStyles] = [BeerStyles(name: "IPA"), BeerStyles(name: "Stout")]
    @State var selectedBeerStyle: BeerStyles!
    
    @State var selectedBeerCategory: BeerCategory!
    @State var addBeerCategory: [BeerCategory] = [BeerCategory(name: "Craft")]


    
    @State var addBeerABV: Float = 0
    @State var addBeerIBU: Float = 0
    @State var addBeerURL: URL!
    @State var addBeerCreated_by: User = User(username: "johnDoe", email: "john@example.com", password: "test", firstname: "John", lastname: "Doe")
    @State var addBeerCreatedAt: Date = Date()
    
    @State var listBeers = [Beer]()

    var body: some View {
        List {
              ForEach(listBeers) { beer in
                  BeerView(beer: beer)
              }
              .onDelete { IndexSet in listBeers.remove(atOffsets: IndexSet)
              }
            }
            .navigationTitle("Bières")
            .navigationBarItems(trailing: Button(action: {self.addBeer.toggle()}, label: { Image(systemName: "plus.square")
                    }
                )
            )
            .sheet(isPresented: $addBeer) {
                VStack {
                    HStack {
                        Text("Name: ")
                        TextField("Beer name", text: self.$addBeerName)
                    }
                    HStack {
                        Text("Description: ")
                        TextField("Beer description", text: self.$addBeerDescription)
                    }
                    HStack {
                        Text("Style:")
                        Picker("Style", selection: $selectedBeerStyle) {
                            ForEach(addBeerStyles, id: \.self) {
                                Text($0.name)
                            }
                        }
                    }
                    HStack {
                        Text("Category:")
                        Picker("Category", selection: $selectedBeerCategory) {
                            ForEach(addBeerCategory, id: \.self) {
                                Text($0.name)
                            }
                        }
                    }
                    HStack {
                        Text("ABV: ")
                        TextField("Beer ABV", value: self.$addBeerABV, format: .number)
                    }
                    HStack {
                        Text("IBU: ")
                        TextField("Beer IBU", value: self.$addBeerIBU, format: .number)
                    }
                    HStack {
                        Text("Photo: ")
                        TextField("Photo url", value: self.$addBeerURL, format: .url)
                    }
                    Button(action: {
                        listBeers.append(Beer(name: addBeerName, description: addBeerDescription, style: selectedBeerStyle, category: selectedBeerCategory, abv: addBeerABV, ibu: addBeerIBU, photo: addBeerURL, created_by: addBeerCreated_by, createdAt: addBeerCreatedAt))

                        self.addBeer.toggle()

                        // Reset Values
//                        self.addBeerName = ""
                    }, label: {
                        Text("Add")
                    })
                }.padding(20)
            }
    }
}

//struct BeerTableView_Preview: PreviewProvider {
//    static var previews: some View {
//        BeerTableView()
//    }
//}

//
//#Preview {
//    BeerTableView()
//}
