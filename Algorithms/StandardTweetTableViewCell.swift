//
//  StandardTweetTableViewCell.swift
//  Algorithms
//
//  Created by Felix Carao on 23/08/2019.
//  Copyright © 2019 Felix Carao. All rights reserved.
//

import UIKit

class StandardTweetTableViewCell: UITableViewCell {
    //MARK: Properties
    @IBOutlet weak var standardText: UILabel!
    @IBOutlet weak var standardAuthorName: UILabel!
    @IBOutlet weak var standardAuthorImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
