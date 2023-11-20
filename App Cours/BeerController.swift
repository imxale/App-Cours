//
//  BeerListViewController.swift
//  App Cours
//
//  Created by Axel Blanchard on 20/11/2023.
//
import UIKit

class BeerController: UITableViewController {
    var beers = [Beer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Liste des Bières"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBeer))
        
        // Exemple d'ajout de bières fictives
        let user1 = User(id: 1, username: "johnDoe", email: "john@example.com", password: "test", firstname: "John", lastname: "Doe")
        let user2 = User(id: 2, username: "JaneSmith", email: "jane@example.com", password: "test", firstname: "Jane", lastname: "Smith")
        
        let beerStyle1 = BeerStyles(name: "IPA")
        let beerStyle2 = BeerStyles(name: "Stout")
        
        let beerCategory1 = BeerCategory(name: "Craft")
        
        let beer1 = Beer(name: "IPA", description: "Une IPA robuste", style: beerStyle1, category: beerCategory1, abv: 6.5, ibu: 60, image: URL(string: "https://example.com/ipa.jpg")!, created_by: user1, approve_by: user2, createdAt: Date(), updatedAt: Date())
        
        let beer2 = Beer(name: "Stout", description: "Une stout riche", style: beerStyle2, category: beerCategory1, abv: 7.0, ibu: 40, image: URL(string: "https://example.com/stout.jpg")!, created_by: user1, createdAt: Date(), updatedAt: Date())
        
        beers = [beer1, beer2]
    }
    
    @objc func addBeer() {
        // Ajoutez le code pour ajouter une bière à la liste
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "beerCell", for: indexPath)
        let beer = beers[indexPath.row]
        cell.textLabel?.text = beer.name
        cell.detailTextLabel?.text = beer.style.name
        return cell
    }
    
    // Ajoutez d'autres méthodes de UITableViewDataSource et UITableViewDelegate si nécessaire
}
