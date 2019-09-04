//
//  HeaderView.swift
//  Algorithms
//
//  Created by Felix Carao on 23/08/2019.
//  Copyright © 2019 Felix Carao. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    
    init(){
        self.addSubview(sectionLabel)
    }
    let sectionLabel = UILabel(frame: CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.width, height: 20))
    sectionLabel.textAlignment = .center
    sectionLabel.text = String(contacts[section][0].firstName.prefix(1))
    headerView.addSubview(sectionLabel)
    return headerView
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
