const toggleSwitch = document.querySelector('input[type="checkbox"]');

// the checkbox itself is hidden via CSS but the checkbox works via using the label
// the label of the checkbox allows you to check and uncheck it and this is how this button works

// 1 Creating a logic to check if the darkMode variable is enabled
const darkModeOn = localStorage.getItem('darkModeOn');
if(JSON.parse(darkModeOn)) {
    setDarkMode(true);
}

// 2 Creating a function that will change the style of a document based on the passed arg
function setDarkMode(a) {
    if(a) {
        document.body.className = 'dark';
        toggleSwitch.checked = true;
        localStorage.setItem('darkModeOn',true);
     }
     else {
         document.body.className = '';
         toggleSwitch.checked = false;
         localStorage.setItem('darkModeOn',false);
     }
}

// 3 Creating a logic that will listen to the click of the button
toggleSwitch.addEventListener('click', function(e){
    setDarkMode(toggleSwitch.checked);
})

