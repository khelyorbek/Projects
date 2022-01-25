"use strict";

/******************************************************************************
 * Handling navbar clicks and updating navbar
 */

/** Show main list of all stories when click site name */

function navAllStories(evt) {
  console.debug("navAllStories", evt);
  hidePageComponents();
  putStoriesOnPage();
  // EK: hiding the submit form if the Hack or Snooze button is clicked
  $('#submit-div').hide();
}

$body.on("click", "#nav-all", navAllStories);

/** Show login/signup on click on "login" */

function navLoginClick(evt) {
  console.debug("navLoginClick", evt);
  hidePageComponents();
  $loginForm.show();
  $signupForm.show();
}

$navLogin.on("click", navLoginClick);

/** When a user first logins in, update the navbar to reflect that. */

function updateNavOnLogin() {
  console.debug("updateNavOnLogin");
  $(".main-nav-links").show();
  $navLogin.hide();
  $navLogOut.show();
  $navUserProfile.text(`${currentUser.username}`).show();
}

// EK: creating an event listener for the navigation link for creating a new story and calling the function that we have created above.
$('#nav-submit').on('click',navSubmitClick);
/* EK: Write a function in nav.js that is called when users click that navbar link. Look at the other function names in that file that do similar things and pick something descriptive and similar. */
function navSubmitClick(e) {
  // outputting a debug message similar to other function in this file
  console.debug("navSubmitClick", e);
  // hiding all the regular stories
  $allStoriesList.hide();
  // showing the div that we have created in HTML code
  $('#submit-div').show();
  // setting the local storage to the page we are currently on
  localStorage.setItem('currPage','new');
}

// EK: Creating an event listener for when people click on Hack or Snooze
// Hides the new div we created and runs the start function to initialize all the items from scratch
// Also setting local storage value so we can track where the user is
$('#nav-all').on('click', function(){{$('#submit-div').hide(); start(); localStorage.setItem('currPage','main')}});