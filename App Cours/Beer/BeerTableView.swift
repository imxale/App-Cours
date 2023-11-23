//
//  BeerView.swift
//  App Cours
//
//  Created by Axel Blanchard on 21/11/2023.
//

import SwiftUI

struct BeerTableView: View {
    
    @State var addBeer = false
    @State var editBeer = false
    
    @State var addBeerStyles: [BeerStyles] = [
        BeerStyles(
            name: "IPA"
        ),
        BeerStyles(
            name: "Stout"
        )
    ]
    
    @State var addBeerCategories: [BeerCategory] = [BeerCategory(
        name: "Craft"
    )]
    
    @State var addBeerCreated_by: User = User(
        username: "johnDoe",
        email: "john@example.com",
        password: "test",
        firstname: "John",
        lastname: "Doe"
    )
        
//    @State var listBeers = [Beer]()
    @ObservedObject var beerListViewModel:BeerListViewModel
    
    @State var showingPopup = false
    
    @State var selectedBeer:Beer?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(beerListViewModel.listBeers) { beer in
//                    BeerView(beer: beer)
                    NavigationLink(destination: BeerDetailView(beer: beer)) {
                        VStack {
                            HStack {
                                AsyncImage(url: beer.photo){ phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
            //                            EmptyView()
                                    case .success(let image):
                                        image.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width:125, height:125)
                                            .cornerRadius(5)
                                    case .failure:
                                        Image(systemName: "photo")
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width:125, height:125)
                                            .cornerRadius(5)
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                                VStack(alignment: .leading) {
                                    Text(beer.name)
                                        .font(.headline)
                                        .lineLimit(1)
                                    Text(beer.description ?? "")
                                }
                            }
                            .padding(.vertical, 8)
                            VStack(alignment: .leading) {
                                Text("ABV : \(beer.formatedABV())")
                                Text("IBU : \(beer.formatedIBU())")
                                Text(beer.style.name)
                            }
                        }
                    }
                        .swipeActions(edge: .leading, allowsFullSwipe: true) {
                            Button {
                                
                            } label: {
                                Label("Like", systemImage: "star")
                            }
                            .tint(.green)
                        }
                        .contentShape(Rectangle())
                            .contextMenu {
                                Button {
                                    self.editBeer.toggle()
                                    selectedBeer = beer
                                } label: {
                                    Label("Edit", systemImage: "pencil")
                                }
                            }
                            .sheet(isPresented: $editBeer) {
                                BeerFormEdit(
                                    editBeer: $editBeer,
                                    showingPopup: $showingPopup,
                                    addBeerStyles: addBeerStyles,
                                    addBeerCategories: addBeerCategories,
//                                    listBeers: listBeers,
                                    beer: selectedBeer ?? beer,
                                    beerListViewModel: beerListViewModel
                                )
                        }
                }
                .onDelete { IndexSet in beerListViewModel.listBeers.remove(atOffsets: IndexSet)
                }
            }
            .navigationTitle(
                "Beers"
            )
            .navigationBarItems(
                trailing: Button(action: {
                    self.addBeer.toggle()
                },
                 label: { Image(
                    systemName: "plus"
                 )
                 }
                )
            )
            .sheet(
                isPresented: $addBeer
            ) {
                BeerFormAdd(
                    addBeer: $addBeer,
                    showingPopup: $showingPopup,
//                    addBeerName: "", 
                    addBeerStyles: addBeerStyles,
                    selectedBeerStyle: addBeerStyles.first!,
                    addBeerCategories: addBeerCategories,
                    selectedBeerCategory: addBeerCategories.first!,
                    addBeerCreated_by: $addBeerCreated_by,
                    beerListViewModel: beerListViewModel
//                    listBeers: $listBeers
                )
            }
        }
    }
}
