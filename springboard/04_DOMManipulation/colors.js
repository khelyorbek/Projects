// writing a function to randomly generate RGB numbers
function randomRGB() {
    const r = Math.floor(Math.random() * 256); // to include 255 in it; Math.floor gives a whole number.
    const g = Math.floor(Math.random() * 256); // to include 255 in it; Math.floor gives a whole number.
    const b = Math.floor(Math.random() * 256); // to include 255 in it; Math.floor gives a whole number.
    return `rgb(${r},${g}, ${b})`
}

// selecting each letter under a class of letter
const letters = document.querySelectorAll('.letter');

// setting a timer so the function runs every .5 seconds
setInterval(function(){
    // running a for of loop to get the value of the node array
    for(let letter of letters){
        // setting each node's color to the randomRGB function
        letter.style.color = randomRGB();
    }
},1000);


// if you need to ever stop the interval (after the page finished loading for example),  you will just need to assign the setInterval to a variable.