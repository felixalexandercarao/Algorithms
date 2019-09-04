//
//  PokedexTableViewCell.swift
//  Algorithms
//
//  Created by Felix Carao on 03/09/2019.
//  Copyright © 2019 Felix Carao. All rights reserved.
//

import UIKit

class PokedexTableViewCell: UITableViewCell {

    //MARK:UIElements
    @IBOutlet weak var backPokemonImageView: UIImageView!
    @IBOutlet weak var frontPokemonImageView: UIImageView!
    @IBOutlet weak var pokemonIdLabel: UILabel!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

