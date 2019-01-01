import { combineReducers } from 'redux';
import sessionReducer from "./session_reducer";
import errorsReducer from "./errors_reducer";
import tweetsReducer from './tweets_reducer';

const rootReducer = combineReducers({
    tweets: tweetsReducer,
    session: sessionReducer,
    errors: errorsReducer
});

export default rootReducer;