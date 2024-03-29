//
//  PokemonInfoTableViewController.swift
//  Algorithms
//
//  Created by Felix Carao on 03/09/2019.
//  Copyright © 2019 Felix Carao. All rights reserved.
//

import UIKit

class PokemonInfoTableViewController: UITableViewController {

    @IBOutlet weak var pokemonName: UILabel!
    var pokemonToDisplay:Pokemon=Pokemon()
    //var selectionDelegate:PokemonSelectionDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */
 }
extension PokemonInfoTableViewController:PokemonSelectionDelegate{
    func getPokemon(pokemon: Pokemon) {
        pokemonName.text=pokemon.name
    }
}
