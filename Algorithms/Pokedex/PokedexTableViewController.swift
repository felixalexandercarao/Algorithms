//
//  PokedexTableViewController.swift
//  Algorithms
//
//  Created by Felix Carao on 03/09/2019.
//  Copyright © 2019 Felix Carao. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher


class PokedexTableViewController: UITableViewController {
    //MARK:Properties
    var pokemon:Pokemon=Pokemon()
    var pokemonList:[Pokemon]=[]
    
   // var selectionDelegate:PokemonSelectionDelegate
    
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
        return 50
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokedexCell", for: indexPath) as? PokedexTableViewCell
        //getPokemonFromApi(id: indexPath.row)
        Alamofire.request("https://pokeapi.co/api/v2/pokemon/\(indexPath.row+1)").responseJSON { response in
            do{
                self.pokemon = try JSONDecoder().decode(Pokemon.self, from: response.data!)
                cell?.frontPokemonImageView.kf.indicatorType = .activity
                cell?.frontPokemonImageView.kf.setImage(with: URL(string:self.pokemon.sprites.front_default))
                cell?.backPokemonImageView.kf.setImage(with: URL(string:self.pokemon.sprites.back_default))
                cell?.pokemonIdLabel.text=String(self.pokemon.id)
                cell?.pokemonNameLabel.text=self.pokemon.name
            } catch let jsonErr{
                print("Error parsing json", jsonErr)
            }
        } 
        return cell!
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    // MARK: - Navigation

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //selectionDelegate.getPokemon(pokemon: getPokemonFromApii(id:indexPath.row))
       getPokemonFromApi(id: indexPath.row)
        performSegue(withIdentifier: "pokedexToInfo", sender: self)
    }
    

   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? PokemonInfoTableViewController
        vc?.pokemonToDisplay=self.pokemon
    }
    
    func getPokemonFromApi(id:Int){
        Alamofire.request("https://pokeapi.co/api/v2/pokemon/\(id+1)").responseJSON { response in
            do{
                self.pokemon = try JSONDecoder().decode(Pokemon.self, from: response.data!)
            } catch let jsonErr{
                print("Error parsing json", jsonErr)
            }
        }
    }
}

func giveUrl(id:Int)->String{
    return "https://pokeapi.co/api/v2/pokemon/\(id+1)"
}

func getPokemonFromApii(id:Int)->Pokemon{
    var _pokemon:Pokemon = Pokemon()
    Alamofire.request("https://pokeapi.co/api/v2/pokemon/\(id+1)").responseJSON { response in
        do{
            _pokemon = try JSONDecoder().decode(Pokemon.self, from: response.data!)
        } catch let jsonErr{
            print("Error parsing json", jsonErr)
        }
    }
    return _pokemon
}

protocol PokemonSelectionDelegate {
    func getPokemon(pokemon:Pokemon)
}
