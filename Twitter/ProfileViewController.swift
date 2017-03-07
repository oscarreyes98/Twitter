//
//  ProfileViewController.swift
//  Twitter
//
//  Created by Oscar Reyes on 3/6/17.
//  Copyright © 2017 Oscar Reyes. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var backgroundView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var followersCountLabel: UILabel!
    
    var tweet: Tweet!
    var dicitionary: NSDictionary!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel.text = tweet.user?.name as String?
        self.usernameLabel.text = "@\((tweet.user?.screenname as String?)!)"
        self.tweetCountLabel.text = "\((tweet.user?.numTweets)!)"
        self.followersCountLabel.text = "\((tweet.user?.followers)!)"
        self.followingCountLabel.text = "\((tweet.user?.following)!)"
        
        if let profileURL = tweet.user?.profileUrl{
            self.profileImageView.setImageWith(profileURL as URL)
        }
        
        if let backgroundURL = tweet.user?.backgroundURL{
            self.backgroundView.setImageWith(backgroundURL as URL)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
