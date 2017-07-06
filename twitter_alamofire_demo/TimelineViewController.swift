//
//  TimelineViewController.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ComposeViewControllerDelegate {
    
    var tweets: [Tweet] = []
    
    @IBOutlet weak var tableView: UITableView!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), for: UIControlEvents.valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        
        refresh()
        
    }
    
    func refresh() {
        APIManager.shared.getHomeTimeLine { (tweets, error) in
            if let tweets = tweets {
                self.tweets = tweets
                self.tableView.reloadData()
            } else if let error = error {
                print("Error getting home timeline: " + error.localizedDescription)
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
        
        cell.tweet = tweets[indexPath.row]
        cell.likeButton.tag = indexPath.row
        cell.retweetButton.tag = indexPath.row
        cell.messageButton.tag = indexPath.row
        cell.commentButton.tag = indexPath.row
        //TODO: do this for all buttons in the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func refreshControlAction(_ refreshControl: UIRefreshControl) {
        refresh()
        refreshControl.endRefreshing()
    }
    
    @IBAction func didTapLogout(_ sender: Any) {
        APIManager.shared.logout()
    }
    
    //IS this the correct way to check if we are liking or dislking? Or is the done automatically?
    @IBAction func onLikeButton(_ sender: Any) {
        let favoriteButton = sender as! UIButton
        let cellRow = favoriteButton.tag
        let tweet = tweets[cellRow]

        if tweet.favorited! {
            tweet.favorited = false
            favoriteButton.isSelected = false
            tweet.favoriteCount -= 1
            APIManager.shared.unfavoriteTweet(tweet: tweet) { (tweet, error) in
                self.refresh()
            }
        } else {
            tweet.favorited = true
            favoriteButton.isSelected = true
            tweet.favoriteCount += 1
            APIManager.shared.favoriteTweet(tweet) { (tweet,error) in
                self.refresh()
            }
        }

    }
    
    @IBAction func onRetweetButton(_ sender: Any) {
        let retweetButton = sender as! UIButton
        let cellRow = retweetButton.tag
        let tweet = tweets[cellRow]
        
        if tweet.retweeted {
            tweet.retweeted = false
            retweetButton.isSelected = false
            tweet.retweetCount -= 1
            APIManager.shared.unRetweet(tweet: tweet) { (tweet,error) in
                self.refresh()
            }
        } else {
            tweet.retweeted = true
            retweetButton.isSelected = true
            tweet.retweetCount += 1
            APIManager.shared.retweet(tweet: tweet) { (tweet,error) in
                self.refresh()
            }
        }
    }
    
    func did(post: Tweet) {
        refresh()
        print("Sucessfully tweeted")
    }
    

    
    
    
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "composeSegue") {
            let navigationController = segue.destination as! UINavigationController
            let composeViewController = navigationController.childViewControllers[0] as!  ComposeViewController
            composeViewController.delegate = self
        } else if(segue.identifier == "detailSegue") {
            let cell = sender as! TweetCell
            if let indexPath = tableView.indexPath(for: cell) {
                let tweet = tweets[indexPath.row]
                let detailController = segue.destination as! DetailViewController
                detailController.tweet = tweet
            }
            
            
        }

     }

    
}
