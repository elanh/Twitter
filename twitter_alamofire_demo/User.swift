//
//  User.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/17/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import Foundation

class User {
    
    var name: String
    var screenName: String
    var bio: String?
    var profileImageUrl: URL
    var backgroundImageUrl: URL?
    var followersCount: Int
    var friendsCount: Int
    
    var dictionary: [String: Any]?
    
    private static var _current: User?
    
    static var current: User? {
        get {
            if _current == nil {
                let defaults = UserDefaults.standard
                if let userData = defaults.data(forKey: "currentUserData") {
                    let dictionary = try! JSONSerialization.jsonObject(with: userData, options: []) as! [String: Any]
                    _current = User(dictionary: dictionary)
                }
            }
            return _current
        }
        set (user) {
            _current = user
            let defaults = UserDefaults.standard
            if let user = user {
                let data = try! JSONSerialization.data(withJSONObject: user.dictionary, options: [])
                defaults.set(data, forKey: "currentUserData")
            } else {
                defaults.removeObject(forKey: "currentUserData")
            }
        }
    }
    
    init(dictionary: [String: Any]) {
        self.dictionary = dictionary
        name = dictionary["name"] as! String
        screenName = dictionary["screen_name"] as! String
        bio = dictionary["description"] as? String
        profileImageUrl = URL(string: (dictionary["profile_image_url_https"] as! String))!
        if let backgroundURLString = dictionary["profile_banner_url"] as? String {
             backgroundImageUrl = URL(string: backgroundURLString)
        }

        followersCount = dictionary["followers_count"] as! Int
        friendsCount = dictionary["friends_count"] as! Int
    }
    
    class func refreshCurrentInstance() {
        APIManager.shared.getCurrentAccount { (user: User?, error:Error?) in
            User.current = user
        }
    }
}

