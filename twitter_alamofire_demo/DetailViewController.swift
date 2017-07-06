//
//  DetailViewController.swift
//  twitter_alamofire_demo
//
//  Created by Elan Halpern on 7/6/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {
    
    @IBOutlet weak var profilePictureImageView: UIImageView!

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var screenameLabel: UILabel!
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    @IBOutlet weak var timestampLabel: UILabel!
    
    @IBOutlet weak var numLikeAndRetweetLabel: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    
    
    
    
    var tweet: Tweet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profilePictureImageView.layer.cornerRadius = 25
        profilePictureImageView.clipsToBounds = true
        
        tweetTextLabel.text = tweet.text
        screenameLabel.text = tweet.user.screenName
        nameLabel.text = tweet.user.name
        timestampLabel.text = tweet.createdAtString
        
        let numLikes = String(describing: tweet.favoriteCount)
        
        let numRetweet = String(describing: tweet.retweetCount)
        numLikeAndRetweetLabel.text = "\(numRetweet) Retweet(s) \(numLikes) Like(s)"
        
        profilePictureImageView.af_setImage(withURL: tweet.user.profileImageUrl)
        
        if tweet.favorited! {
            favoriteButton.isSelected = true
        } else {
            favoriteButton.isSelected = false
        }
        
        if tweet.retweeted {
            retweetButton.isSelected = true
        } else {
            retweetButton.isSelected = false
        }
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
