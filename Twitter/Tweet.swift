//
//  Tweet.swift
//  Twitter
//
//  Created by Oscar Reyes on 2/25/17.
//  Copyright © 2017 Oscar Reyes. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    
    var text: NSString?
    var timestamp: NSDate?
    var reteweetCount: Int = 0
    var favoritesCount: Int = 0
    var name: NSString?
    var screenname: NSString?
    var profileUrl: NSURL?
    
    
    init(dictionary: NSDictionary){
        text = dictionary["text"] as? String as NSString?
        
        reteweetCount =  (dictionary["retweet_count"] as? Int) ?? 0
        favoritesCount = (dictionary["favourites_count"] as? Int) ?? 0
        
        let timestampString = dictionary["created_at"] as? String
        if let timestampString = timestampString{
            
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        timestamp = formatter.date(from: timestampString) as NSDate?
        }
        
        name = dictionary["name"] as? String as NSString?
        screenname = dictionary["screen_name"] as? String as NSString?
        let profileUrlString = dictionary["profile_image_url"] as? String
        if let profileUrlString = profileUrlString{
            profileUrl = NSURL(string: profileUrlString)
        }

        print("Tweet class hey you got \(name)")
        print("hey this is your favorties \(favoritesCount)")
        print("hey this is your tweet \(text)")
        print("hey this is your url \(profileUrlString)")


    }

    
    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet]{
        var tweets = [Tweet]()
    
        for dictionary in dictionaries{
            let tweet = Tweet(dictionary: dictionary)
            
            tweets.append(tweet)
    
        }
        return tweets
    }
}
