//
//  PostsTableViewCell.swift
//  Algorithms
//
//  Created by Felix Carao on 04/09/2019.
//  Copyright © 2019 Felix Carao. All rights reserved.
//

import UIKit

class PostsTableViewCell: UITableViewCell {

    @IBOutlet weak var postTitle: UILabel!
    
    @IBOutlet weak var postBody: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
