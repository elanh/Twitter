# Project 4 - *Twitter*

**Twitter** is a basic twitter app to read and compose tweets the [Twitter API](https://apps.twitter.com/).

Time spent: **20** hours spent in total

## User Stories

The following **required** functionality is completed:

- [ x] User sees app icon in home screen and styled launch screen
- [x ] User can sign in using OAuth login flow
- [ x] User can Logout
- [ x] User can view last 20 tweets from their home timeline
- [x ] In the home timeline, user can view tweet with the user profile picture, username, tweet text, and timestamp.
- [ x] User can pull to refresh.
- [ x] User can tap the retweet and favorite buttons in a tweet cell to retweet and/or favorite a tweet.
- [ x] User can compose a new tweet by tapping on a compose button.
- [ x] Using AutoLayout, the Tweet cell should adjust it's layout for iPhone 7, Plus and SE device sizes as well as accommodate device rotation.
- [x ] The current signed in user will be persisted across restarts

The following **optional** features are implemented:

- [x ] Tweet Details Page: User can tap on a tweet to view it, with controls to retweet, favorite, and reply.
- [x ] User can view their profile in a profile tab
- [ ] User should display the relative timestamp for each tweet "8m", "7h"
- [x ] User should be able to unretweet and unfavorite and should decrement the retweet and favorite count.
- [ ] Links in tweets are clickable
- [ x] User can tap the profile image in any tweet to see another user's profile
   - [x ] Contains the user header view: picture and tagline
   - [ x] Contains a section with the users basic stats: # tweets, # following, # followers
   - [x ] Profile view should include that user's timeline
- [ ] User can load more tweets once they reach the bottom of the feed using infinite loading similar to the actual Twitter client.
- [ ] When composing, you should have a countdown in the upper right for the tweet limit.
- [x ] After creating a new tweet, a user should be able to view it in the timeline immediately without refetching the timeline from the network.
- [ ] User can reply to any tweet, and replies should be prefixed with the username and the reply_id should be set when posting the tweet
- [x ] Profile view should include that user's timeline
- [ ] Pulling down the profile page should blur and resize the header image.

The following **additional** features are implemented:

- [ ] User can edit their personal profile page by choosing their banner image and profile picture image, as well as setting their bio. 

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. I would like to discuss further how we can add extensions that twitter does not even have. 
2. I think it would be cool to add the ability to watch videos inside a tweet and I hope to learn how to do that in my application. 

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='http://imgur.com/a/VH8FY' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes
A big challenge with this app was getting the autolayout. I think it was a good practice for what we will have to deal with in the future, however, to be completley honest, I still am not super comfortable with autolayout.

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library

## License

    Copyright Elan Halpern

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
