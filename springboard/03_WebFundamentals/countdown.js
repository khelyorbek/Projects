function countdown(num) {
    // creating a for loop to loop through each number till it hits num
    for(let i=0;i<num;i++) {
            // using an anonymous function to output the num and then reduce it by 1
            // this will display 10 first, reduce num to 9, then assign 10 a delay of 10*1000=10 secs
            setTimeout(function(){console.log(num); num--;},1000*i);
        }
    
    // because JS will always run this first, i assigned the delay as the original number * 1000 ms
    // this ensures that the text below will always show last
    setTimeout(function(){console.log("DONE!");},num*1000);
    }

// example is 10
countdown(10);

