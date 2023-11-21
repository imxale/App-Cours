//
//  ContentView.swift
//  App Cours
//
//  Created by Axel Blanchard on 20/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State var user1 = User(username: "johnDoe", email: "john@example.com", password: "test", firstname: "John", lastname: "Doe")
    @State var user2 = User(username: "JaneSmith", email: "jane@example.com", password: "test", firstname: "Jane", lastname: "Smith")
        
    var body: some View {
//        NavigationView {
//            BeerTableView()
//        }
        TabBar()
    }
}

//struct ContentView_Preview: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

//#Preview {
//    ContentView()
//}
