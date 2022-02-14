// Home > Adding the logic when the submit button is presssed
$('#guessButton').on('click', async function(e){
    // Preventing the default behavoir of the form (reload)
    e.preventDefault();

    // Mapping the value of the input to a variable
    const $guessInputValue = $('#guessInput').val();

    if($guessInputValue === '') {
        alert('The input is empty! Please type your guess and click SUBMIT again.')
    } else {
        // Debugging
        // console.log("Guess Input:" + $guessInputValue)

        // Calling the sendGuess fucntion that we wrote and passing the guessInputValue into it
        const checkResult= await sendGuess($guessInputValue)

        // Creating a variable where we can store the human readible description of the result
        let checkResultText = ""

        // Interpretting the response from the check and putting it into human readible format
        if(checkResult === "ok") {
            checkResultText = "Good job! Typed word exists on the board and in the txt file"
            // Calling the addToScore function if guessed right and passing the input value
            addToScore($guessInputValue)
        } else if(checkResult === "not-on-board") {
            checkResultText = "Try again! Typed word exists in the txt file but NOT on the board"
        } else {
            checkResultText = "Oh no! Typed word does NOT exists in the txt file nor on the board"
        }
        // There is a p with id #flash_message, setting its innerText as the response we got from the check
        $('#flash_message').text(checkResultText)
    }
})

// Home > Method to send a guess input value to the server
async function sendGuess(GuessWord) {
    // Sending an AJAX request with a word parameter set to the GuessWord attribute that was passed to this function
    // turning the passed word into lowercase and saving the response to a variable res
    const $res = await axios.get('/check', {params: {word: GuessWord.toLowerCase()}})

    // JSON response contains either a dictionary of {“result”: “ok”}, {“result”: “not-on-board”}, or {“result”: “not-a-word”}, so the front-end can provide slightly different messages depending if the word is valid or not.
    // Returning the result of the check
    return $res.data['result']
}

// Home > Method to add the lenght of the word to the score if guessed correctly
async function addToScore(word) {
    // getting the lenth of the passed word and setting it to a variable points
    const points = word.length
    // sending a post request to the address and passing the add parameter which contains the length to add to the score
    // Must use JSON.stringify so the points is a string
    const resp = await axios.post("/add_score", { add: JSON.stringify(points) });
    
    // setting the text of the span to the new score value
    // our /add_score returns a string so no need to parse
    $('#game_score').text(resp.data)
}

// Home > Timer Left > Setting an interval to run a function each second
// saving the timer id into a variable called i_id
i_id = setInterval(cal_time_left,1000);

// Function for Time Left
async function cal_time_left() {
    // Takes the current value of the time_left span and converts it to int and stores in variable
    time_left = parseInt($('#time_left').text())
    // If the time left is more than 1 second
    if(time_left > 1) {
        // Remove 1 second from the counter
        time_left = time_left - 1;
        // Set the value of the span to the new value of the counter
        $('#time_left').text(time_left);
    } else {
        // Sets the Time Left counter to Out of Time
        $('#time_left').text("Out of time");
        // After 60 seconds is passed, hides the form (input + button)
        $('#guessForm').hide()
        // Changes the paragraph's innter text to
        $('#flash_message').text("Game over! To play again, please refresh the page.")
        // Stops the JS timer
        clearInterval(i_id)
        
        // Getting the current score that the user got
        const currentScore = $('#game_score').text()
        // When the game ends, send an AJAX POST request to the server and pass the currentScore variable
        const res = await axios.post("/end_game", { current_score: currentScore });
    }

}