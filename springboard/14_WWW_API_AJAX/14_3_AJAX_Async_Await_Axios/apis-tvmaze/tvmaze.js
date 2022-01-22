/** Given a query string, return array of matching shows:
 *     { id, name, summary, episodesUrl }
 */


/** Search Shows
 *    - given a search term, search for tv shows that
 *      match that query.  The function is async show it
 *       will be returning a promise.
 *
 *   - Returns an array of objects. Each object should include
 *     following show information:
 *    {
        id: <show id>,
        name: <show name>,
        summary: <show summary>,
        image: <an image from the show data, or a default imege if no image exists, (image isn't needed until later)>
      }
 */
async function searchShows(query) {
  // TODO: Make an ajax request to the searchShows api.  Remove
  // hard coded data.

  // using axious to send a GET request with the query passed
  const res = await axios.get(`https://api.tvmaze.com/search/shows?q=${query}`)
  let img = "http://tinyurl.com/missing-tv";
  // using map to loop through the array and only leaving the data that we need
  const shows = res.data.map(i => {
    if(i.show.image) {
      img = i.show.image.medium;
    }
    

    return {
      id: i.show.id,
      // returning the variable
      image: img,
      name: i.show.name,
      summary: i.show.summary
    }
  })
  // once all the shows are populated, returning the array
  return shows;
}



/** Populate shows list:
 *     - given list of shows, add shows to DOM
 */

function populateShows(shows) {
  const $showsList = $("#shows-list");
  $showsList.empty();


  for (let show of shows) {
    let $item = $(
      `<div class="col-md-6 col-lg-3 Show" data-show-id="${show.id}">
         <div class="card" data-show-id="${show.id}">
         <img class="card-img-top" src="${show.image}">
           <div class="card-body">
             <h5 class="card-title">${show.name}</h5>
             <p class="card-text">${show.summary}</p>

             <!-- Add an “Episodes” button at the bottom of each show card -->

             <button id="episodesBtn" class="btn btn-primary">Episodes</button>
           </div>
         </div>
       </div>
      `);

    $showsList.append($item);
  }

  episodesBtn();
}


/** Handle search form submission:
 *    - hide episodes area
 *    - get list of matching shows and show in shows list
 */

$("#search-form").on("submit", async function handleSearch(evt) {
  evt.preventDefault();


  let query = $("#search-query").val();
  if (!query) return;

  $("#episodes-area").show();
  // re-enabling the episodes area 
  let shows = await searchShows(query);

  populateShows(shows);


});


/** Given a show ID, return list of episodes:
 *      { id, name, season, number }
 */

async function getEpisodes(id) {
  // TODO: get episodes from tvmaze
  //       you can get this by making GET request to
  //       http://api.tvmaze.com/shows/SHOW-ID-HERE/episodes

  // TODO: return array-of-episode-info, as described in docstring above

  // getting the episodes using axous
  const res = await axios.get(`http://api.tvmaze.com/shows/${id}/episodes`);

  // using map to loop through the array and only getting the needed data
  const episodes = res.data.map(i => {
    return {
      id: i.id,
      name: i.name,
      season: i.season,
      number: i.number
    }
  })

  return episodes;
}

async function populateEpisodes(arrEp) {
  // makking the ul to a variable
  const ul = document.getElementById('episodes-list');
  // emptying out the ul every time
  ul.innerHTML = '';

  // looping through a passed array
  for (let ep of arrEp) {
    // for every item we create a new li
    const newLi = document.createElement('li');
    // setting the inner text of the li
    newLi.innerText = `${ep.name} (season ${ep.season}, number ${ep.number})`;
    // appeding the new li into the ul
    ul.append(newLi);
  }
}


async function episodesBtn() {
  // mapping all buttons to a variable
  const episodesBtn = document.querySelectorAll('#episodesBtn');

  // looping through each button and adding an event listener
  for (let btn of episodesBtn) {
    // makring the function as async because we are getting data in getEpisode(id);
    btn.addEventListener('click',async function (e) {
      // on click getting the data-show.id of the parent div
      const id = e.target.parentElement.parentElement.dataset.showId;
      
      // Debugging purposes
      // console.log("Id of show: " + id);

      // mapping episodes by calling a getepisodes function
      const episodes = await getEpisodes(id);
      // Debugging purposes
      // console.log(episodes);

      // popuplating the UL with all the episodes
      populateEpisodes(episodes);

      // Scrolling the window to the episodes area
      window.open('#episodes-area',"_self");
    })
  }
}