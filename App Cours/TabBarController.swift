//
//  TabBarController.swift
//  App Cours
//
//  Created by Axel Blanchard on 20/11/2023.
//

//import Foundation
import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Créez le contrôleur de vue de la liste des bières
        let beerListVC = BeerController()
        let beerListNavController = UINavigationController(rootViewController: beerListVC)
        beerListNavController.tabBarItem = UITabBarItem(title: "Bières", image: nil, tag: 0)

        // Créez des contrôleurs de vue pour les autres onglets (pour l'instant sans redirection)
        let tab1VC = UIViewController()
        tab1VC.view.backgroundColor = .white
        tab1VC.tabBarItem = UITabBarItem(title: "Onglet 1", image: nil, tag: 1)

        let tab2VC = UIViewController()
        tab2VC.view.backgroundColor = .white
        tab2VC.tabBarItem = UITabBarItem(title: "Onglet 2", image: nil, tag: 2)

        let tab3VC = UIViewController()
        tab3VC.view.backgroundColor = .white
        tab3VC.tabBarItem = UITabBarItem(title: "Onglet 3", image: nil, tag: 3)

        let tab4VC = UIViewController()
        tab4VC.view.backgroundColor = .white
        tab4VC.tabBarItem = UITabBarItem(title: "Onglet 4", image: nil, tag: 4)

        // Ajoutez les contrôleurs de vue à la tab bar
        viewControllers = [beerListNavController, tab1VC, tab2VC, tab3VC, tab4VC]
    }
}
