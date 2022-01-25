"use strict";

const BASE_URL = "https://hack-or-snooze-v3.herokuapp.com";

/******************************************************************************
 * Story: a single story in the system
 */

class Story {

  /** Make instance of Story from data object about story:
   *   - {title, author, url, username, storyId, createdAt}
   */

  constructor({ storyId, title, author, url, username, createdAt }) {
    this.storyId = storyId;
    this.title = title;
    this.author = author;
    this.url = url;
    this.username = username;
    this.createdAt = createdAt;
  }

  /** Parses hostname out of URL and returns it. */

  getHostName() {
    // UNIMPLEMENTED: complete this function!
    return "hostname.com";
  }
}


/******************************************************************************
 * List of Story instances: used by UI to show story lists in DOM.
 */

class StoryList {
  constructor(stories) {
    this.stories = stories;
  }

  /** Generate a new StoryList. It:
   *
   *  - calls the API
   *  - builds an array of Story instances
   *  - makes a single StoryList instance out of that
   *  - returns the StoryList instance.
   */

  static async getStories() {
    // Note presence of `static` keyword: this indicates that getStories is
    //  **not** an instance method. Rather, it is a method that is called on the
    //  class directly. Why doesn't it make sense for getStories to be an
    //  instance method?

    // query the /stories endpoint (no auth required)
    const response = await axios({
      url: `${BASE_URL}/stories`,
      method: "GET",
    });

    // turn plain old story objects from API into instances of Story class
    // will get only the needed data and attach a getHostName function
    const stories = response.data.stories.map(story => new Story(story));

    // build an instance of our own class using the new array of stories
    return new StoryList(stories);
  }

  // UNIMPLEMENTED: complete this function!
  /** Adds story data to API, makes a Story instance, adds it to story list.
 * - user - the current instance of User who will post the story
 * - obj of {title, author, url}
 *
 * Returns the new Story instance
 */

  // EK Subpart 2A: Sending Story Data to the Backend API
  async addStory(user, { title, author, url }) {

    // getting the token that will be used to post
    const token = user.loginToken;

    // sending a post request to the api
    const res = await axios.post(`${BASE_URL}/stories`, { token, story: { title, author, url } });

    // making a story instance and passing the response into it
    const story = new Story(res.data.story);

    // adding the story to the story list
    this.stories.push(story);

    // returning the newly created story instance as asked
    return story;
  }
}


/******************************************************************************
 * User: a user in the system (only used to represent the current user)
 */

class User {
  /** Make user instance from obj of user data and a token:
   *   - {username, name, createdAt, favorites[], ownStories[]}
   *   - token
   */

  constructor({
    username,
    name,
    createdAt,
    favorites = [],
    ownStories = []
  },
    token) {
    this.username = username;
    this.name = name;
    this.createdAt = createdAt;

    // instantiate Story instances for the user's favorites and ownStories
    this.favorites = favorites.map(s => new Story(s));
    this.ownStories = ownStories.map(s => new Story(s));

    // store the login token on the user so it's easy to find for API calls.
    this.loginToken = token;
  }
  // EK: Part 3: Display Favorite stories (UI)
  static showFavIcons(storyId) {

    // getting the list of favorites and converting to array with only story ids
    const favsArray = currentUser.favorites.map(i => i.storyId);

    // looping through each item in favorite array
    for (let f of favsArray) {
      // if the item from the list matches favorite
      if (f === storyId) {
        // return a red heart
        return `<span class="favIcon">❤️</span><a id="delIcon" class="hidden">🗑️</a>`;
      }
    }
    // otherwise return white heart
    return `<span class="favIcon">🤍</span><a id="delIcon" class="hidden">🗑️</a>`;
  }

  // EK: Part 3: Send favorite story id to API (JS)
  static async toggleFavIcon(storyId) {
    // getting the list of favorites and converting to array with only story ids
    const favsArray = currentUser.favorites.map(i => i.storyId);

    // looping through each item in favorite array
    for (let f of favsArray) {
      // if the item from the list matches favorite
      if (f === storyId) {
        // delete the favorite from the api
        await axios.delete(`${BASE_URL}/users/${currentUser.username}/favorites/${storyId}`, { params: {token: currentUser.loginToken }});
        
      } else {
        // otherwise mark the item as favorite
        await axios.post(`${BASE_URL}/users/${currentUser.username}/favorites/${storyId}`, {token: currentUser.loginToken });
        
      }
    }

  }

  /** Register new user in API, make User instance & return it.
   *
   * - username: a new username
   * - password: a new password
   * - name: the user's full name
   */

  static async signup(username, password, name) {
    const response = await axios({
      url: `${BASE_URL}/signup`,
      method: "POST",
      data: { user: { username, password, name } },
    });

    let { user } = response.data

    return new User(
      {
        username: user.username,
        name: user.name,
        createdAt: user.createdAt,
        favorites: user.favorites,
        ownStories: user.stories
      },
      response.data.token
    );
  }

  /** Login in user with API, make User instance & return it.

   * - username: an existing user's username
   * - password: an existing user's password
   */

  static async login(username, password) {
    const response = await axios({
      url: `${BASE_URL}/login`,
      method: "POST",
      data: { user: { username, password } },
    });

    let { user } = response.data;

    return new User(
      {
        username: user.username,
        name: user.name,
        createdAt: user.createdAt,
        favorites: user.favorites,
        ownStories: user.stories
      },
      response.data.token
    );
  }

  /** When we already have credentials (token & username) for a user,
   *   we can log them in automatically. This function does that.
   */

  static async loginViaStoredCredentials(token, username) {
    try {
      const response = await axios({
        url: `${BASE_URL}/users/${username}`,
        method: "GET",
        params: { token },
      });

      let { user } = response.data;

      return new User(
        {
          username: user.username,
          name: user.name,
          createdAt: user.createdAt,
          favorites: user.favorites,
          ownStories: user.stories
        },
        token
      );
    } catch (err) {
      console.error("loginViaStoredCredentials failed", err);
      return null;
    }
  }

}
