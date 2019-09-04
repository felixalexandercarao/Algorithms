//
//  Contact.swift
//  Algorithms
//
//  Created by Felix Carao on 22/08/2019.
//  Copyright © 2019 Felix Carao. All rights reserved.
//

import UIKit

class Contact{
    var firstName:String
    var lastName:String
    var phoneNumber:String
    var initials:String
    init(_firstName:String,_lastName:String,_phoneNumber:String){
        self.firstName=_firstName
        self.lastName=_lastName
        self.phoneNumber=_phoneNumber
        self.initials="\(_firstName.prefix(1))\(_lastName.prefix(1))"
    }
}

class ContactGroup{
    var isExpanded:Bool
    var contacts:[Contact]
    init(_contacts:[Contact]) {
        self.contacts=_contacts
        isExpanded=true
    }
}
