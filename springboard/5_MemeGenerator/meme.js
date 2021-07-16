// Task: create a simple app to generate spicy memes from any input image and text you choose

// creating variables to store DOM elements
const memeURL = document.querySelector('#memeURL');
const memeTextTop = document.querySelector('#memeTextTop');
const memeTextBot = document.querySelector('#memeTextBot');
const memeForm = document.querySelector('#memeForm');
const memeContainer = document.querySelector('#memeContainer');

// creating a click logic to generate a meme on form submission
memeForm.addEventListener('submit',function(event){
        // preventing the webpage from reloading when the submit button is pressed
        event.preventDefault();
        
    // <<<< GENERATING A MASTER DIV THAT WILL HOUSE EVERYTHING >>>>>
        const elParentDiv = document.createElement('div');
        // setting the position to relative so it can act as a prent for absolute divs inside 
        elParentDiv.style.position = 'relative';
        // setting the dispaly to inline block so the text and everything else doesn't overflow to the next meme
        elParentDiv.style.display = 'inline-block';
        // adding a simple margin at the top so the meme imgs can be separated
        elParentDiv.style.marginTop = '2rem';
        
    // <<<<< GENERATING A DIV THAT WILL HOUSE THE IMG >>>>>
        const elImgDiv = document.createElement('div');

    // <<<<< GENERATING THE IMAGE ITSELF >>>>>
        // creating an img element
        const elImg = document.createElement('img');
        // setting the img src as the value passed to the URL textbox
        elImg.src = memeURL.value;

        // enable this if you want to see the url in the console
        // console.log("URL: "+ elImg.src);

    // <<<<< ADDING THE IMAGE TO THE IMAGE DIV >>>>>
        elImgDiv.append(elImg);
        // setting the position to relative so it can act as a prent for absolute divs inside 
        elImgDiv.style.position = 'relative';
        

    // <<<<< GENERATING A DIV THAT WILL HOUSE TOP TEXT >>>>>
        const elTextTopDiv = document.createElement('div');
        // setting the position to absolute so it can be stuck to the top of relative parent 
        elTextTopDiv.style.position = 'absolute';
        // making the text stay 2vh from the top of the parent
        elTextTopDiv.style.top = '2vh';
        // making the width as 100% so it takes the entire line
        elTextTopDiv.style.width = '100%';
        // making the text centered
        elTextTopDiv.style.textAlign = 'center';

    // <<<<< GENERATING THE TOP TEXT >>>>>
        // getting the value from the top text box and storing it in a variable
        const elTextTop = memeTextTop.value;
        // enable this if you want to see the top text in the console
        // console.log("Top Text: " + elTextTop);

        // setting the inside of the div as the value received from the form
        elTextTopDiv.innerText = elTextTop;
        //adding the top text into the img DIV
        elImgDiv.append(elTextTopDiv);
        
    // <<<<< GENERATING A DIV THAT WILL HOUSE BOTTOM TEXT >>>>>
        const elTextBotDiv = document.createElement('div');
        // setting the position to absolute so it can be stuck to the top of relative parent 
        elTextBotDiv.style.position = 'absolute';
        // making the text stay 3vh from the bottom of the parent
        elTextBotDiv.style.bottom = '3vh';
        // making the width as 100% so it takes the entire line
        elTextBotDiv.style.width = '100%';
        // making the text centered
        elTextBotDiv.style.textAlign = 'center';

    // <<<<< GENERATING THE BOTTOM TEXT >>>>>
        // getting the value from the bottom text box and storing it in a variable    
        const elTextBot = memeTextBot.value;
        // enable this if you want to see the top text in the console
        //console.log("Bottom Text: " + elTextBot)

        // setting the inside of the div as the value received from the form
        elTextBotDiv.innerText = elTextBot;
        //adding the bottom text into the img DIV
        elImgDiv.append(elTextBotDiv);


    // <<<<< ADDING THE IMAGE DIV TO THE PARENT DIV THAT HOUSES EVERYTHING >>>>>
        elParentDiv.append(elImgDiv);  
    // <<<<< APPENDING THET PARENT DIV THAT HAS EVERYTHING TO THE MEME CONTAINER SECTION >>>>>
        memeContainer.append(elParentDiv);

    // <<<<< CLEARING OUT ALL THE VALUES FROM THE INPUT BOXES >>>>>
    memeURL.value = '';
    memeTextTop.value = '';
    memeTextBot.value = '';
})

// creating a variable that stored the amount of time that the user entered the meme div
// this is to make sure that the event listener below doesn't keep generating a million new REMOVE ITEM buttons
let entryCounter = 0;

// <<<<< Creating a logic that will show the remove button when hovering over an image >>>>>
memeContainer.addEventListener('mouseover', function(event){
    // if the hovered target is an image or a div, the code can run.
    // We don't want the REMOVE ITEM button to be created in the section. only the div that has the meme inside of it
    if(event.target.tagName === 'IMG' || event.target.tagName === 'DIV') {
        // once an image or a div has been hovered over, check to make sure it hasn't already been hovered
        if(entryCounter === 0) {
        // creating a div element to store the REMOVE ITEM element and storing into a variable
        const elRmvBtn = document.createElement('div');
        // adding a class of removeBtn to the div so we can style easier with CSS and so we can find it with JS
        elRmvBtn.classList.add('removeBtn');
        // making the position of the element as absolute so it can stick to the parent div
        elRmvBtn.style.position = 'absolute';
        // setting the text of the div to be REMOVE ITEM
        elRmvBtn.innerText = 'REMOVE ITEM'
        // making the div appear at the 40% mark vertically
        elRmvBtn.style.top = '40%';
        // setting the width of a div to be 100% so it takes the entire middle space
        elRmvBtn.style.width = '100%';    
        // centering the REMOVE ITEM text
        elRmvBtn.style.textAlign = 'center';
        // adding the newly created REMOVE ITEM div into its parent which is the meme box div that houses everything
        event.target.parentElement.append(elRmvBtn);
        // once everything is done, add 1 to the counter so JS remember how many times this specific div has been hovered over
        entryCounter++;
        }
    } 
})

// setting up another listener when the mouse leaves the DIV that is being hovered right now
memeContainer.addEventListener('mouseout', function(event){
    // once the mouse leaves, the counter immediately gets set back to 0
    entryCounter = 0;
    // finding the div element that has the class of .removeBtn. 
    // You might think that JS will remove all of the REMOVE ITEM divs on the page when hovered over, but
    // that's not true because the logic in our function above only creates this button and assign a class when a mouse hovers over
    // TLDR: when you hover out, there is only 1 element with the class of removeBtn and that's the one that was cleated when you hovered on
    const findBtn = document.querySelector('.removeBtn');
    
    // Creating a logic to catch a rare error that might be thrown out when the user hovers out and the REMOVE ITEM button has not yet added.
    if(findBtn===null) {
        // if this happens it just outputs a console log and doesn't try to remove the item and causing an error.
        console.log('remove button doesnt exist');
    } else {
        // if its doesn't happen, the REMOTE ITEM div gets removed as we want.
        findBtn.remove();
    }
    
    }
)

// setting up another listener for when the meme div gets click after hovering. to make sure remove function works.
memeContainer.addEventListener('click', function(event){
    // checking again to make sure the element clicked is an img or a DIV. We don't want to be abel to delete the entire section
    if(event.target.tagName === 'IMG' || event.target.tagName === 'DIV') {
        // find the elParentDiv element that is used to house everything and remove it.
        // event.target is the img itself
        // event.target.parentElement is the Div that houses the image
        // event.target.parentElement.parentElement is the Div that houses everything related to the particulat meme
        event.target.parentElement.parentElement.remove();
    }
})