const form = document.querySelector('#logoform');
const brandInput = document.querySelector('input[name=brandname]');
const colorInput = document.querySelector('input[name=color]');
const fontSizeInput = document.querySelector('input[name=fontsize]');
const results = document.querySelector('#results');

form.addEventListener('submit',function(event){
    event.preventDefault();
    console.log("Submitted");
    console.log("Text: " + brandInput.value,
    "\nColor: " + colorInput.value, 
    "\nFont Size: " + fontSizeInput.value)

    // saving the value into a new variable.
    const newLogo = makeLogo(brandInput.value,colorInput.value,fontSizeInput.value);

    results.append(newLogo);
})

function makeLogo(text, color, size) {
    const logo = document.createElement('h2');
    // using innerText to pass the text from an input as its value
    logo.innerText = text;
    
    // setting the background color of the element as the # color passed into the function
    logo.style.caolor = color;

    // setting the size of the elemtn as the size passed int othe function
    logo.style.fontSize = size + 'px';

    // retuns the logo with all the properties above
    return logo;
}
