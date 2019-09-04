//
//  TweetTableViewController.swift
//  Algorithms
//
//  Created by Felix Carao on 23/08/2019.
//  Copyright © 2019 Felix Carao. All rights reserved.
//

import UIKit

class TweetTableViewController: UITableViewController {
    
    let tweetList:[Tweet]=[Imagetweet(tweetText: "merry christmas", tweetAuthor: "chika", imageUrl: "longpic", tweetAuthorImageUrl:"https://i.imgur.com/0btR08J.png"),Tweet(tweetType: "Standard", tweetText: "Im da bestnsjnsdjfnsdkjfnskjfnskjfnsdkjfnksjfnkdsjfnksdjfnkdsjfnkdsjfnskjfndksjfndsjfnkdsjnfksdnfksdjnfdskjfnsdkjfnsdkjfnsdjfnsdkjfskjfnskjfnskjfnskjfnskjfnsdkjfnsdk", tweetAuthor: "Lex Carao", tweetAuthorImageUrl:"https://i.imgur.com/kpOf6bu.png"),
    Imagetweet(tweetText: "merry christmas", tweetAuthor: "chika", imageUrl: "shortpic", tweetAuthorImageUrl:"https://i.imgur.com/0btR08J.png")]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tweetList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tweet=tweetList[indexPath.row]
        if tweet.tweetType=="Standard"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "StandardTweet", for: indexPath) as? StandardTweetTableViewCell
            
            cell?.standardAuthorImage.load(url: URL(string:tweet.tweetAuthorImageUrl)!)
            cell?.standardAuthorName.text=tweet.tweetAuthor
            cell?.standardText.text=tweet.tweetText
            return cell!
        }
            let _tweet=tweet as! Imagetweet
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTweet", for: indexPath) as? ImageTweetTableViewCell
            let tweetImage=UIImage(named:_tweet.imageUrl)
            cell?.imageText.text=_tweet.tweetText
            cell?.imageAuthorName.text=_tweet.tweetAuthor
            cell?.imageAuthorImage.load(url: URL(string:tweet.tweetAuthorImageUrl)!)
            cell?.imageDisplayedImage.image=tweetImage
            cell?.imageDisplayedImage.widthAnchor.constraint(equalToConstant:200).isActive = true
            cell?.imageDisplayedImage.heightAnchor.constraint(equalToConstant: ((200*(tweetImage?.size.height)!)/(tweetImage?.size.width)!)).isActive = true
            return cell!
    }
 
    override func viewWillAppear(_ animated: Bool) {
        tableView.estimatedRowHeight=600
        tableView.rowHeight=UITableView.automaticDimension
    }

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
