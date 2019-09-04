//
//  Pokemon.swift
//  Algorithms
//
//  Created by Felix Carao on 03/09/2019.
//  Copyright © 2019 Felix Carao. All rights reserved.
//

import UIKit

class Pokemon:Decodable{
    var id:Int
    var name:String
    var sprites:Sprites
    init() {
        self.id = -1
        self.name = "defaultname"
        self.sprites = Sprites()
    }
}
