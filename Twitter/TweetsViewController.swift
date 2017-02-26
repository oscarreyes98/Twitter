//
//  TweetsViewController.swift
//  Twitter
//
//  Created by Oscar Reyes on 2/26/17.
//  Copyright © 2017 Oscar Reyes. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController //UITableViewDataSource, UITableViewDelegate {
{
    @IBOutlet var tableView: UITableView!
    

    var tweets: [Tweet]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TwitterClient.sharedInstance?.homeTimeLine(success: { (tweets: [Tweet]) in
            self.tweets = tweets
            
            for tweet in tweets{
                print(tweet.text as Any)
            }
        }, failure: { (error: NSError) in
            print(error.localizedDescription)
        })
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onLogoutButton(_ sender: Any) {
        TwitterClient.sharedInstance?.logout()
        
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
