"use strict";

/******************************************************************************
 * Handling navbar clicks and updating navbar
 */

/** Show main list of all stories when click site name */

function navAllStories(evt) {
  console.debug("navAllStories", evt);
  hidePageComponents();
  putStoriesOnPage();
  // EK hiding the submit form if the Hack or Snooze button is clicked
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

/* EK Write a function in nav.js that is called when users click that navbar link. Look at the other function names in that file that do similar things and pick something descriptive and similar. */
function navSubmitClick(e) {
  console.debug("navSubmitClick", e);
  hidePageComponents();
  $allStoriesList.hide();
  $('#submit-div').show();
}

$('#nav-submit').on('click',navSubmitClick);