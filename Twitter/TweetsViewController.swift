//
//  TweetsViewController.swift
//  Twitter
//
//  Created by Oscar Reyes on 2/26/17.
//  Copyright © 2017 Oscar Reyes. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet var tableView: UITableView!
    

    var tweets: [Tweet]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 200

        TwitterClient.sharedInstance?.homeTimeLine(success: { (tweets: [Tweet]) in
            self.tweets = tweets
            self.tableView.reloadData()
            
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tweets != nil{
            return tweets!.count
        }else{
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCellTableViewCell
        
        //cell.user = self.tweets?[indexPath.row]
        
        cell.tweet = self.tweets?[indexPath.row]
        
        
        return cell
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
