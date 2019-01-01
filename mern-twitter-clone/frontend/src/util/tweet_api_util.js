import axios from "axios";

export const getTweets = () => {
    return axios.get('/api/tweets');
};

export const getUserTweets = userId => {
    return axios.get(`/api/tweets/user/${userId}`);
}

export const writeTweet = data => {
    return axios.post('/api/tweets/', data);
};