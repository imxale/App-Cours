//
//  TabBarControllerRepresentable.swift
//  App Cours
//
//  Created by Axel Blanchard on 20/11/2023.
//

import Foundation
import SwiftUI

struct TabBarControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let tabBarController = TabBarController()
        return tabBarController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Mettez à jour si nécessaire
    }
}
