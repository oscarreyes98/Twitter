//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Oscar Reyes on 2/26/17.
//  Copyright © 2017 Oscar Reyes. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var picImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var loveCountLabel: UILabel!
    
    @IBAction func retweetButton(_ sender: Any) {
        
    }
    
    @IBAction func loveButton(_ sender: Any) {
    }
    
    
    
    var tweet: Tweet?{
        didSet{
           // self.timestampLabel.text = "\(self.tweet?.timestamp)"
            self.tweetLabel.text = self.tweet?.text as String?
            //
            if let profPic = self.tweet?.profileUrl{
            self.picImageView.setImageWith(profPic as URL)
            }
            
            
            self.nameLabel.text = self.tweet?.name as String?
            self.usernameLabel.text = self.tweet?.screenname as String?
            //
            
            if let time = self.tweet?.timestamp{
                self.timestampLabel.text = String(describing: time)
            }
            
            if let retweet = self.tweet?.reteweetCount{
                self.retweetCountLabel.text = String(describing: retweet)
            }
            if let favorites = self.tweet?.favoritesCount{
                self.loveCountLabel.text = String(describing: favorites)
            }
            
            
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
