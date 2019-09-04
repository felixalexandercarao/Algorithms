//
//  StaticTableViewController.swift
//  Algorithms
//
//  Created by Felix Carao on 22/08/2019.
//  Copyright © 2019 Felix Carao. All rights reserved.
//

import UIKit

class StaticTableViewController: UITableViewController {
    var lastVolume:String = ""
    @IBOutlet weak var wifiSwitch: UISwitch!
    @IBOutlet weak var airplaneSwitch: UISwitch!
    @IBOutlet weak var bluetoothSwitch: UISwitch!
    @IBOutlet weak var volemeLevel: UILabel!
    @IBOutlet weak var isMuted: UISwitch!
    @IBOutlet weak var stepper: UIStepper!
    //MARK:Actions
    @IBAction func airplaneSwitch(_ sender: UISwitch) {
        wifiSwitch.isOn=false
        bluetoothSwitch.isOn=false
    }
    
    @IBAction func muteVolume(_ sender: UISwitch) {
        if sender.isOn==true{
            lastVolume=volemeLevel.text!
            volemeLevel.text="0"
        }
        if sender.isOn==false{
            volemeLevel.text=lastVolume
        }
    }
    
    @IBAction func increaseVolume(_ sender: UIStepper) {
        volemeLevel.text = (Int(sender.value)).description
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        volemeLevel.text=String(50)
        isMuted.isOn=false
        stepper.value=50
        stepper.maximumValue=100
        stepper.minimumValue=0
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 2
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
