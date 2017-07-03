//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import Alamofire

class TweetCell: UITableViewCell {

    
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    @IBOutlet weak var profilePictureImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var timestampLabel: UILabel!
    
    @IBOutlet weak var numLikesLabel: UILabel!
    
    @IBOutlet weak var numRetweetLabel: UILabel!
    
 
    
    
    var tweet: Tweet! {
        didSet {
            tweetTextLabel.text = tweet.text
            usernameLabel.text = tweet.user.screenName
            nameLabel.text = tweet.user.name
            timestampLabel.text = tweet.createdAtString
            
            let numLikes = String(describing: tweet.favoriteCount)
            let numRetweet = String(describing: tweet.retweetCount)
            
            numLikesLabel.text = numLikes
            numRetweetLabel.text = numRetweet
            
            profilePictureImageView.image.af_setImage(withURL: tweet.user.profileImageUrl)
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
