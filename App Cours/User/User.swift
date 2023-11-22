//
//  User.swift
//  App Cours
//
//  Created by Axel Blanchard on 20/11/2023.
//

import Foundation

class User: Identifiable {
    var id = UUID()
    var username: String
    var email: String
    var password: String
    var firstname: String
    var lastname: String
    
    init(id: UUID = UUID(), username: String, email: String, password: String, firstname: String, lastname: String) {
        self.id = id
        self.username = username
        self.email = email
        self.password = password
        self.firstname = firstname
        self.lastname = lastname
    }
}
