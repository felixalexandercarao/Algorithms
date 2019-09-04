//
//  ContactTableViewController.swift
//  Algorithms
//
//  Created by Felix Carao on 22/08/2019.
//  Copyright © 2019 Felix Carao. All rights reserved.
//

import UIKit

//MARK: Main methods
class ContactTableViewController: UITableViewController {
    var contactToBePassed:Contact?=nil
    var contacts:[ContactGroup] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        loadContacts()
        navigationItem.title="Contacts"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! ContactInfoTableViewController
        vc.contactToBeUsed=self.contactToBePassed
    }
    
    @IBAction func contactDeleteButtonPressed(_ sender: listDeleteButton) {
        contacts[sender.indexPath.section].contacts.remove(at: sender.indexPath.row)
        
        if contacts[sender.indexPath.section].contacts.count == 0{
            contacts.remove(at: sender.indexPath.section)
            tableView.reloadData()
        } else {
            tableView.reloadSections([sender.indexPath.section], with: .fade)
        }   
    }
    
}

//MARK: Delegate methods
extension ContactTableViewController{
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contactGroup=contacts[indexPath.section]
        contactToBePassed=contactGroup.contacts[indexPath.row]
        performSegue(withIdentifier: "ListToInfo", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let collapseButton = UIButton(type: .system )
        collapseButton.setTitle(String(contacts[section].contacts[0].firstName.prefix(1)), for: .normal)
        collapseButton.addTarget(self, action: #selector(handleOpenClose), for: .touchUpInside)
        collapseButton.tag=section
        return collapseButton
    }
    
    @objc func handleOpenClose(button:UIButton){
        let sectionNumber = button.tag
        contacts[sectionNumber].isExpanded = !contacts[sectionNumber].isExpanded
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if contacts[section].isExpanded==true{
            return contacts[section].contacts.count
        }
        else{
            return 0
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier1 = "ContactTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier1, for: indexPath) as! ContactTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let contact = contacts[indexPath.section].contacts[indexPath.row]
        cell.contactDeleteButton.tag = indexPath.row
        
        cell.contactDeleteButton.indexPath.row=indexPath.row
        
        cell.contactDeleteButton.indexPath.section=indexPath.section
        cell.contactImage.text=contact.initials
        cell.contactName.text="\(contact.firstName) \(contact.lastName)"
        cell.contactNumber.text=contact.phoneNumber
        return cell
    }
    
    func loadContacts(){
        let contactlex = Contact(_firstName: "Lex", _lastName: "Carao", _phoneNumber: "09179665988")
        let contactjelma = Contact(_firstName: "Jelmarose", _lastName: "De Vera", _phoneNumber: "09178453216")
        let contactaaron = Contact(_firstName: "Aaron", _lastName: "Custodio", _phoneNumber: "09178974567")
        let contactarnold = Contact(_firstName: "Arnold", _lastName: "Mendoza", _phoneNumber: "091795874567")
        let contactalex = Contact(_firstName: "Alex", _lastName: "Great", _phoneNumber: "091798874567")
        let contactlino = Contact(_firstName: "Lino", _lastName: "Reyes", _phoneNumber: "09179665988")
        let contactjohn = Contact(_firstName: "John", _lastName: "Doe", _phoneNumber: "09178453216")
        let contactcharles = Contact(_firstName: "Charles", _lastName: "Nazarenp", _phoneNumber: "09178974567")
        let contactcyla = Contact(_firstName: "Cyla", _lastName: "Calpito", _phoneNumber: "091795874567")
        contacts+=[ContactGroup(_contacts: [contactaaron, contactarnold, contactalex]), ContactGroup(_contacts: [contactcyla, contactcharles]), ContactGroup(_contacts: [contactlex, contactlino]), ContactGroup(_contacts: [contactjelma, contactjohn])]
    }
}
