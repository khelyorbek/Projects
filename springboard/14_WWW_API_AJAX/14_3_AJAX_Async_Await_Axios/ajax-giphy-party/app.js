console.log("Let's get this party started!");
// creating variables for each html element
const searchInput = document.getElementById('searchText');
const searchBtn = document.getElementById('searchBtn');
const removeAllBtn = document.getElementById('removeAllBtn');
const content = document.getElementById('content');

// creating an async function
async function getGiphy(word) {
    // api is the same as in example
    // q = search word
    // limit = 1 

    const res = await axios.get('https://api.giphy.com/v1/gifs/search',{params: {q:word,limit:1,api_key:'MhAodEJIJxQMxW9XqxKjyXfNYdLoOIym'}})

    // adding to the body 
    // see giphy API docs for what res.data.data[0].images.downsized.url is
    const url = res.data.data[0].images.downsized.url;
    console.log("Img url: ", url);
    addToBody(url);
}

function addToBody(url){
    const newImg = document.createElement('img');
    newImg.src = url;
    content.append(newImg);
}

searchBtn.addEventListener('click', function(e) {
    // preventing default reload behaviour
    e.preventDefault();
    // calling the function I wrote and passing the keyword from input
    getGiphy(searchInput.value);
    // clearing out the input once done
    searchInput.value = '';
} );

removeAllBtn.addEventListener('click', function(e) {
    // preventing default reload behaviour
    e.preventDefault();

    content.innerHTML = '';
})