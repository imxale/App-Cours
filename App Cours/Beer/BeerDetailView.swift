//
//  BeerDetailView.swift
//  App Cours
//
//  Created by Axel Blanchard on 21/11/2023.
//

import SwiftUI

struct BeerDetailView: View {
    let beer: Beer
    var body: some View {
        GeometryReader { proxy in
                    ZStack {
                        VStack {
                            AsyncImage(url: beer.photo){ phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth:.infinity, maxHeight:300)
                                        .cornerRadius(5)
                                        .background(.orange)
                                        .shadow(radius: 2)
                                case .failure:
                                    Image(systemName: "photo")
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width:125, height:125)
                                        .cornerRadius(5)
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            Text(beer.name)
                                .font(.largeTitle)
                                .padding(.bottom, 10)
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus quis massa et eros volutpat posuere a vel nisl.")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .padding()
                            Text("ABV : \(formatedFloat(value:beer.abv))")
                                .background(.red)
                            Text("IBU : \(formatedFloat(value:beer.ibu))")
                            Text(beer.style.name)
                            Text(beer.category.name)
                            NavigationLink(destination: UserDetailView(user: beer.created_by)) {
                                Text(beer.created_by.username)
                            }
                            Text(beer.createdAt.formatted(.dateTime.day().month().year()))
                        }
                    }
                    .navigationTitle(beer.name)
                    .edgesIgnoringSafeArea(.bottom)
                }
    }
}

//func formatedFloat(value: Float) -> String {
//    let formattedFloat = String(format: "%.1f", value)
//    return formattedFloat
//}

//struct BeerDetailView_Preview: PreviewProvider {
//    static var previews: some View {
//        BeerDetailView(beer: Beer(name: "", style: "", category: "", abv: 0, ibu: 0, photo: URL(string: "")!, created_by: 0, createdAt: Date(), updatedAt: Date()))
//    }
//}

//#Preview {
//    BeerDetailView()
//}
