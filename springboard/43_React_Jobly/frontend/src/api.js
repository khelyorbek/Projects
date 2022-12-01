import axios from "axios";

const BASE_URL = process.env.REACT_APP_BASE_URL || "http://localhost:3001";

/** API Class.
 *
 * Static class tying together methods used to get/send to to the API.
 * There shouldn't be any frontend-specific stuff here, and there shouldn't
 * be any API-aware stuff elsewhere in the frontend.
 *
 */

class JoblyApi {
  // the token for interactive with the API will be stored here.
  static token;

  static async request(endpoint, data = {}, method = "get") {
    console.debug("API Call:", endpoint, data, method);

    //there are multiple ways to pass an authorization token, this is how you pass it in the header.
    //this has been provided to show you another way to pass the token. you are only expected to read this code for this project.
    const url = `${BASE_URL}/${endpoint}`;
    const headers = { Authorization: `Bearer ${JoblyApi.token}` };
    const params = (method === "get")
      ? data
      : {};

    try {
      return (await axios({ url, method, data, params, headers })).data;
    } catch (err) {
      console.error("API Error:", err.response);
      let message = err.response.data.error.message;
      throw Array.isArray(message) ? message : [message];
    }
  }

  // Individual API routes

  /** Get details on a company by handle. */
  static async getCompany(handle) {
    let res = await this.request(`companies/${handle}`);
    return res.company;
  }

  // Get all the companies
  static async getCompanies(name) {
    // looks like provide request function accepts data where we can pass the name to
    // which will allow us to filter it out
    // this is aget request to endpoint
    let res = await this.request(`companies`, { name });
    // only responding with the companies array
    return res.companies;
  }

  // Getting all the jobs
  static async getJobs(title) {
    // looks like provide request function accepts data where we can pass the name to
    // which will allow us to filter it out
    // this is a GET request
    let res = await this.request(`jobs`, { title });
    return res.jobs;
  }

  // Signing up with a new user id
  static async signup(data) {
    // sending a post request to auth/register endpoint and sending the data passed to this function
    // respond with the token that we receive.
    // POST request
    let res = await this.request(`auth/register`, data, "post");
    return res.token;
  }

  // Login function
  static async login(data) {
    // send a POST request to an endpoint
    let res = await this.request(`auth/token`, data, "post");
    // returns a token which is then stored inside App.js inside a localStorage
    return res.token;
  }

  // function to get current user
  static async getCurrentUser(username) {
    // sending a get request to the users/username endpoint
    // returning the user in the response
    // sends a GET request to the endpoint
    let res = await this.request(`users/${username}`);
    // responds with the user object
    return res.user;
  }

  // function to save user's profile
  static async saveProfile(username, data) {
    // sending a patch request to the endpoint and passing the data sent this function
    let res = await this.request(`users/${username}`, data, "patch");
    // responding with the updated user
    return res.user;
  }

  // function to apply for new jobs
  static async applyToJob(username, id) {
    // sends a post request to an endpoint with the name of user and id of a job
    await this.request(`users/${username}/jobs/${id}`, {}, "post");
    // doesn't return anything because we have application array in the state in the App
  }

}

// below is for debugging purposes only
// for now, put token ("testuser" / "password" on class)
// JoblyApi.token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZ" +
//   "SI6InRlc3R1c2VyIiwiaXNBZG1pbiI6ZmFsc2UsImlhdCI6MTU5ODE1OTI1OX0." +
//   "FtrMwBQwe6Ue-glIFgz_Nf8XxRT2YecFCiSpYL0fCXc";

export default JoblyApi;