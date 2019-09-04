//
//  ContactTableViewCell.swift
//  Algorithms
//
//  Created by Felix Carao on 22/08/2019.
//  Copyright © 2019 Felix Carao. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    //MARK:Propeties
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactNumber: UILabel!
    @IBOutlet weak var contactImage: UILabel!
    
    @IBOutlet weak var contactDeleteButton: listDeleteButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
