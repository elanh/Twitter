//
//  ProfileViewController.swift
//  twitter_alamofire_demo
//
//  Created by Elan Halpern on 7/6/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ComposeViewControllerDelegate {
    
    
    @IBOutlet weak var coverPhotoImageView: UIImageView!
    
    @IBOutlet weak var profilePictureImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var screennameLabel: UILabel!
    
    @IBOutlet weak var bioLabel: UILabel!
    
    @IBOutlet weak var numFollowingLabel: UILabel!
    
    @IBOutlet weak var numFollowersLabel: UILabel!
    
    var tweets: [Tweet] = []
    var user: User!

    @IBOutlet weak var tweetsTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tweetsTableView.dataSource = self
        tweetsTableView.delegate = self
        
        user = User.current
        
        nameLabel.text = user.name
        screennameLabel.text = user.screenName
        bioLabel.text = user.bio
        numFollowingLabel.text = String(user.friendsCount)
        numFollowersLabel.text = String(user.followersCount)
        
        
        profilePictureImageView.layer.cornerRadius = 25
        profilePictureImageView.clipsToBounds = true
        
        profilePictureImageView.af_setImage(withURL:user.profileImageUrl)
        
//        coverPhotoImageView.af_setImage(withURL: (user.backgroundImageUrl)!)
        
        refresh()
    }
    
    func refresh() {
        APIManager.shared.getUserTimeline(user) { (tweets, error) in
            if let tweets = tweets {
                self.tweets = tweets
                self.tweetsTableView.reloadData()
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

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func onRetweet(_ sender: Any) {
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
    
    
    @IBAction func onFavoritebutton(_ sender: Any) {
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
    

    
    
    
    
    
    
    
    
    
    
    func did(post: Tweet) {
        refresh()
        print("Sucessfully tweeted")
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
