//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by Elan Halpern on 7/5/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import RSKPlaceholderTextView

protocol ComposeViewControllerDelegate {
    func did(post: Tweet)
}

class ComposeViewController: UIViewController {

     var delegate: ComposeViewControllerDelegate?
    
    @IBOutlet weak var tweetTextView: RSKPlaceholderTextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tweetTextView.placeholder = "What's happening?"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTweetButton(_ sender: Any) {
        APIManager.shared.composeTweet(with: tweetTextView.text) { (tweet, error) in
            if let error = error {
                print("Error composing Tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                self.delegate?.did(post: tweet)
                print("Composed tweet!")
            }
        }
        self.dismiss(animated: true)
    }

    
    @IBAction func onCancelButton(_ sender: Any) {
        self.dismiss(animated: true) {
        }
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
