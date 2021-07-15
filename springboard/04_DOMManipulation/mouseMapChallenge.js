// adding an event listener that looks for mouse movement
document.addEventListener('mousemove', function(event) {
   
    // finding the width of a current page
    const inWidth = window.innerWidth;
    
    // finding the heigth of a current page
    const inHeigth = window.innerHeight;

    //finding the current location of a mouse on the X axis (width)
    const findMouseX = event.pageX;

    //finding the current location of a mouse on the Y axis (height)
    const findMouseY = event.pageY;

    //finding the denominator between width and X, heigth and Y. Will be used later
    const widthDenom = inWidth / findMouseX;
    const heightDenom = inHeigth / findMouseY;

    // What my thinking is //
    // if width is at 1000
    // if the mouse is at 200 x
    // 1000/200=5 which means that mouse is at 1/5 of a screen
    // which menas that we can assign 1/5th of 255 (max value for RGB)
    
    // Calculating the number from 0-255 based on the position of X on the screen
    const rgbR = 255 / widthDenom;
    console.log("X: " + Math.floor(rgbR));

    // Calculating the number from 0-255 based on the position of Y on the screen
    const rgbB = 255 / heightDenom;
    console.log("Y: " + Math.floor(rgbB));



    // This was painful. It appears that background color function cannot accept the entire command as one single string and figure out the values and arithmetic from this function in JS.
    // You need to explicitly tell it that rgb( is a string that needs to be passed to CSS, then rgbR is an integer and must be passed as a number etc
    document.body.style.backgroundColor = "rgb("+rgbR+","+ 0 +","+rgbB+")";
    
})

