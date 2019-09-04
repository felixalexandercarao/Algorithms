//
//  PostsTableViewController.swift
//  Algorithms
//
//  Created by Felix Carao on 04/09/2019.
//  Copyright © 2019 Felix Carao. All rights reserved.
//

import UIKit

class PostsTableViewController: UITableViewController {
    var errorString:String=""
    private let networkServices = NetworkServices()
    var postList:[[String:Any]]=[]
    override func viewDidLoad() {
        networkServices.getPosts(url: "https://jsonplaceholder.typicode.com/posts") { (posts, error) in
            
            if let error = error{
                self.errorString=error.localizedDescription
            }else if let posts = posts{
                self.postList=posts
                print("API Finished")
                self.tableView.reloadData()
            }
        }
        
        super.viewDidLoad()
    }
    //networkServices.getPosts(url: urlToExecute) { (json, error) in
    //    if let error = error{
    //        self.jsonTextView.text = error.localizedDescription
    //    }else if let json = json{
    //        self.jsonTextView.text=json.description
    //    }
    //}
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return postList.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostsTableViewCell
        cell?.postTitle.text=postList[indexPath.row]["title"] as? String
        cell?.postBody.text=postList[indexPath.row]["body"] as? String
        return cell!
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.estimatedRowHeight=600
        tableView.rowHeight=UITableView.automaticDimension
    }

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
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
