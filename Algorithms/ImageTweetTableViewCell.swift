//
//  ImageTweetTableViewCell.swift
//  Algorithms
//
//  Created by Felix Carao on 23/08/2019.
//  Copyright © 2019 Felix Carao. All rights reserved.
//

import UIKit

class ImageTweetTableViewCell: UITableViewCell {

 
    @IBOutlet weak var imageAuthorImage: UIImageView!
    
    @IBOutlet weak var imageText: UILabel!
    @IBOutlet weak var imageAuthorName: UILabel!
    @IBOutlet weak var imageDisplayedImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
//        imageDisplayedImage.widthAnchor.constraint(equalToConstant:wwidth).isActive = true
//        imageDisplayedImage.heightAnchor.constraint(equalToConstant: (imageDisplayedImage.image?.size.height)!).isActive = true
        imageDisplayedImage.translatesAutoresizingMaskIntoConstraints=false
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
