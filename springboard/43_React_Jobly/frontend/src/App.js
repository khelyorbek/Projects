// Standard React Library
import React, { useState, useEffect } from 'react';
import jwt from "jsonwebtoken";

// React router
import { BrowserRouter } from 'react-router-dom';

// CSS and assets
import './App.css';

// Custom components and functions
import JoblyApi from './api';
import NavigationBar from './NavigationBar';
import Routes from './Routes';
import GlobalContext from './GlobalContext';

function App() {
  // setting the state at the topmost level for the currentUser and the setter function for it
  // by default it is set to null. we will then replace this null with the data from API
  const [currentUser, setCurrentUser] = useState(null);
  
  // this a function that allows us to store our token inside a local variable. key here is the name of the localStorage variable name
  function useLocalStorage(key, firstValue = null) {
    const initialValue = localStorage.getItem(key) || firstValue;
  
    const [item, setItem] = useState(initialValue);
  
    useEffect(function setKeyInLocalStorage() {
      console.debug("hooks useLocalStorage useEffect", "item=", item);
  
      if (item === null) {
        localStorage.removeItem(key);
      } else {
        localStorage.setItem(key, item);
      }
    }, [key, item]);
  
    return [item, setItem];
  }

  // treating our custom localStorage function like its a hook but in reality its just a function that return 2 items
  const [token, setToken] = useLocalStorage('token');
  
  // Create an effect triggered by a state change of the token: this should call the backend to get information on the newly-logged-in user and store it in the currentUser state.
  useEffect(() => {
    
    // custom function for getting the user's profile
    async function getCurrentUser() {
      // only reaching out to API and using JWT if the token exists
      // console.log("getCurrentUser > token >>>", token);
      if (token) {
        // destructuring the token to receive the username of the user
        let { username } = jwt.decode(token);
        // console.log("getCurrentUser > username >>>", username);
        // When you get a token from the login and register processes, store that token on the JoblyApi class
        // this token is then used to communicate with the API when the token is required. Such as updating the profile
        JoblyApi.token = token;
        // sending an API request to get the curernt user and then storing into the state
        setCurrentUser(await JoblyApi.getCurrentUser(username));
      }
    }
    
    // running the async function
    getCurrentUser();

  // watching for any changes in the token 
  }, [token])

  // custom function for signing up
  async function signup(data) {
    try {
      // using our custom API function
      let resToken = await JoblyApi.signup(data);
      // setting the localStorage variable to the token received
      setToken(resToken);
      // returning complete, this will be used later for confirming that everything went well (example: in the Login page)
      return "complete"
      
    } catch(e) {
      // catching and logging the error if we encounter any
      console.log("App > signup > error: ", e);
    }
    
  }

  // custom function for logging in
  async function login(data) {
    let resToken = '';

    try {
      // using our custom API function
      resToken = await JoblyApi.login(data);
      // setting the localStorage variable to the token received
      setToken(resToken);
      // returning complete, this will be used later for confirming that everything went well (example: in the Login page)
      return "complete"
    } catch(e) {
      // catching and returning the error if we encounter any. this will be used later in the other function to output the message of the error
      // example is the login page where we can show an Alert based on the error message
      return e;
    }
    
  }

  // custom function for logging out
  function logout() {
    // setting the current user to none
    setCurrentUser(null);
    // settubg the current token to none
    setToken(null);
  }

  return (
    <div className="App">
      {/* Passing the current user and the setter function to set the user as the context */}
      <GlobalContext.Provider value={{ currentUser, setCurrentUser }}>
        <BrowserRouter>

          {/* Passing the logout function so we can use it in our navbar when the link is clicked */}
          < NavigationBar logout={logout}/>

          {/* Passing the login and the signup function so we can use them in our routes properly and pass them down also */}
          < Routes login={login} signup={signup}/>

        </BrowserRouter>
      </GlobalContext.Provider>
    </div>
  );
}

export default App;
