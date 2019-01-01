import * as TweetUtil from "../util/tweet_api_util";

export const RECEIVE_TWEETS = "RECEIVE_TWEETS";
export const RECEIVE_USER_TWEETS = "RECEIVE_USER_TWEETS";
export const RECEIVE_NEW_TWEET = "RECEIVE_NEW_TWEET";

export const receiveTweets = tweets => {
    return {
        type: RECEIVE_TWEETS,
        tweets
    };
};

export const receiveUserTweets = tweets => {
    return {
        type: RECEIVE_USER_TWEETS,
        tweets
    };
};

export const receiveNewTweet = tweet => {
    return {
        type: RECEIVE_NEW_TWEET,
        tweet
    };
};

export const fetchTweets = () => dispatch => {
    return TweetUtil.getTweets()
        .then( tweets => dispatch(receiveTweets(tweets)) )
        .catch( err => console.log(err))
};

export const fetchUserTweets = (userId) => dispatch =>  {
    return TweetUtil.getUserTweets(userId)
        .then( tweets => dispatch(receiveUserTweets(tweets)) )
        .catch( err => console.log(err))
};

export const composeTweet = data => dispatch => {
         return TweetUtil.writeTweet(data)
           .then(tweet => dispatch(receiveNewTweet(tweet)))
           .catch(err => console.log(err));
       };