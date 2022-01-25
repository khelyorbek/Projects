"use strict";

// This is the global list of the stories, an instance of StoryList
let storyList;

/** Get and show stories when site first loads. */

async function getAndShowStoriesOnStart() {
  storyList = await StoryList.getStories();
  $storiesLoadingMsg.remove();

  putStoriesOnPage();
}

/**
 * A render method to render HTML for an individual Story instance
 * - story: an instance of Story
 *
 * Returns the markup for the story.
 */

function generateStoryMarkup(story) {
  // console.debug("generateStoryMarkup", story);

  const hostName = story.getHostName();
  
  return $(`
      <li id="${story.storyId}">
      ${
        // EK: Executing a function that adds the fav icon
        User.showFavIcons(story.storyId)
      }
        <a href="${story.url}" target="a_blank" class="story-link">
          ${story.title}
        </a>
        <small class="story-hostname">(${hostName})</small>
        <small class="story-author">by ${story.author}</small>
        <small class="story-user">posted by ${story.username}</small>
      </li>
    `);
}


/** Gets list of stories from server, generates their HTML, and puts on page. */

function putStoriesOnPage() {
  console.debug("putStoriesOnPage");

  $allStoriesList.empty();

  // loop through all of our stories and generate HTML for them
  for (let story of storyList.stories) {
    const $story = generateStoryMarkup(story);
    $allStoriesList.append($story);
  }

  $allStoriesList.show();
}

// EK: creating an even listener for the new story nav button. 
// I have to use prevent default here because if I don't, I get XHR Cancelled. Its an axios issue.
// Found solution here: https://github.com/axios/axios/issues/1428
$('#submit-btn').on('click',function(e){ e.preventDefault(); postNewStory()});

//EK: Write a function in stories.js that is called when users submit the form. Pick a good name for it. This function should get the data from the form, call the .addStory method you wrote, and then put that new story on the page.
async function postNewStory() {
  const author = $('#submit-author').val();
  const title = $('#submit-title').val();
  const url = $('#submit-url').val();

  // taking a global variable from user.js and putting into a local variable
  // const user = currentUser.username;

  // have to reference storyList otherwise the function will not be found
  // posting the values to the API
  await storyList.addStory({title, author, url});

  // hiding the div that has all the elements for the new post
  $('#submit-div').hide();
  // restarting the entire page load sequence so we can show the posts and grab all new data.
  start();
}

// EK: creating an event listener for the favorites button in the nav bar
$('#nav-favs').on('click',getAllFavs);
//EK: Writing a function that will display all the favorite stories
async function getAllFavs() {
  const favsDiv = $('#favs-div');
  favsDiv.empty();

  $('#submit-div').hide();
  $allStoriesList.empty();

  const usr = await User.loginViaStoredCredentials(currentUser.loginToken, currentUser.username);

  // loop through all of our stories and generate HTML for them
  for (let story of usr.favorites) {
    const $story = generateStoryMarkup(story);
    $allStoriesList.append($story);
  }
  $allStoriesList.show();
  // setting the local storage to the page we are currently on
  localStorage.setItem('currPage','favs');
}

// EK: creating an event listener for my stories button
$('#nav-mine').on('click',getMyStories);
//EK: Writing a function that will display all the favorite stories
async function getMyStories() {
  const favsDiv = $('#favs-div');
  favsDiv.empty();

  $('#submit-div').hide();
  $allStoriesList.empty();

  // loop through all of our stories and generate HTML for them
  for (let story of currentUser.ownStories) {
    const $story = generateStoryMarkup(story);
    $allStoriesList.append($story);
  }
  $allStoriesList.show();

  $("span").remove();
  const trash = $("li a:first-child");
  trash.toggleClass("hidden");

  trash.on('click', async function(e){
    await axios.delete(`${BASE_URL}/stories/${e.target.parentElement.id}`, { params: {token: currentUser.loginToken }});
    e.target.parentElement.remove();
    // hiding the div that has all the elements for the new post
  })
  
  // setting the local storage to the page we are currently on
  localStorage.setItem('currPage','myStories');
}

//EK: Adding an event listener for toggling favorites on the main board
$('ol').on('click', 'span' , function(e){
  // if the class name of the target is favIcon, continue 
  if(e.target.className === "favIcon") {
    // send the id of the parent to the function
    User.toggleFavIcon(e.target.parentElement.id);
   }
   // update the icon based on what it is right now
   if(e.target.innerText == "🤍") {
    e.target.innerText = "❤️";
   } else {
    e.target.innerText = "🤍"
   }
  
  // console.log(e.target.parentElement.id);
})