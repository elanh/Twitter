//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage


class TweetCell: UITableViewCell {

    
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    @IBOutlet weak var profilePictureImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var timestampLabel: UILabel!
    
    @IBOutlet weak var numLikesLabel: UILabel!
    
    @IBOutlet weak var numRetweetLabel: UILabel!
    
    @IBOutlet weak var messageButton: UIButton!
    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var commentButton: UIButton!
    
    var tweet: Tweet! {
        didSet {
            
            profilePictureImageView.layer.cornerRadius = 25
            profilePictureImageView.clipsToBounds = true
            
            tweetTextLabel.text = tweet.text
            usernameLabel.text = tweet.user.screenName
            nameLabel.text = tweet.user.name
            timestampLabel.text = tweet.createdAtString
            
            let numLikes = String(describing: tweet.favoriteCount)

            let numRetweet = String(describing: tweet.retweetCount)
            
            numLikesLabel.text = numLikes
            numRetweetLabel.text = numRetweet
            
            profilePictureImageView.af_setImage(withURL: tweet.user.profileImageUrl)
            
            if tweet.favorited! {
                likeButton.isSelected = true
            } else {
                likeButton.isSelected = false
            }
            
            if tweet.retweeted {
                retweetButton.isSelected = true
            } else {
                retweetButton.isSelected = false
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
