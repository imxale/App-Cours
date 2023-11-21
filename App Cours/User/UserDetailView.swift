//
//  UserDetailView.swift
//  App Cours
//
//  Created by Axel Blanchard on 21/11/2023.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    var body: some View {
        Text(user.username)
        Text(user.firstname)
        Text(user.lastname)
    }
}

//#Preview {
//    UserDetailView()
//}
