//
//  BeerView.swift
//  App Cours
//
//  Created by Axel Blanchard on 21/11/2023.
//

import SwiftUI

struct BeerView: View {
    let beer: Beer
    var body: some View {
        NavigationLink(destination: BeerDetailView(beer: beer)) {
            VStack {
                HStack {
                    AsyncImage(url: beer.photo){ phase in
                        switch phase {
                        case .empty:
                            ProgressView()
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
                    }.background(.purple)
                }
                .padding(.vertical, 8)
                VStack(alignment: .leading) {
                    Text("ABV : \(formatedFloat(value:beer.abv))")
                    Text("IBU : \(formatedFloat(value:beer.ibu))")
                    Text(beer.style.name)
                }.background(.red)
            }
        }
    }
}

//struct BeerView_Preview: PreviewProvider {
//    static var previews: some View {
//        BeerView(beer: Beer(name: "", style: "", category: "", abv: 0, ibu: 0, photo: URL(string: "")!, created_by: 0, createdAt: Date(), updatedAt: Date()))
//    }
//}
