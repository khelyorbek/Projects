function randomGame() {
    // initializing the counter as 0
    let count = 0;

    // starting an interval timer and assiginng the Interval ID to a variable loop
    let loop = setInterval(function(){
        // creating a variable that holds a random number with 2 decimals after .
        let rand = Math.round(Math.random()*100)/100;
        // logs every random number generated
        console.log(rand);
        // adds to the counter every time a number is generated
        count++;

        // if the random number is greater than 0.75
        if(rand>0.75) {
            // logs the amount of tries it took to get there
            console.log("Amount of tries: " + count);
            // stops the time by clearing the interval based on the Interval ID variable loop
            clearInterval(loop);
        }
    // 1000 ms = 1 second
    },1000); 
}

// calling the created function to execute it.
randomGame();