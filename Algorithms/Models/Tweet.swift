//
//  Tweet.swift
//  Algorithms
//
//  Created by Felix Carao on 23/08/2019.
//  Copyright © 2019 Felix Carao. All rights reserved.
//

import UIKit

class Tweet{
    var tweetType:String
    var tweetText:String
    var tweetAuthor:String
    var tweetAuthorImageUrl:String
    init(tweetType:String, tweetText:String, tweetAuthor:String, tweetAuthorImageUrl:String){
        self.tweetType=tweetType
        self.tweetText=tweetText
        self.tweetAuthor=tweetAuthor
        self.tweetAuthorImageUrl=tweetAuthorImageUrl
    }
}

class Retweet:Tweet{
    var quotingTweet:Tweet
    init(tweetText:String, tweetAuthor:String,quotingTweet:Tweet, tweetAuthorImageUrl:String){
        self.quotingTweet=quotingTweet
        super.init(tweetType: "Retweet", tweetText: tweetText, tweetAuthor:tweetAuthor, tweetAuthorImageUrl:tweetAuthorImageUrl)
    }
}

class Imagetweet:Tweet{
    var imageUrl:String
    init(tweetText:String, tweetAuthor:String,imageUrl:String, tweetAuthorImageUrl:String){
        self.imageUrl=imageUrl
        super.init(tweetType: "Image", tweetText: tweetText, tweetAuthor:tweetAuthor, tweetAuthorImageUrl:tweetAuthorImageUrl)
    }
}
