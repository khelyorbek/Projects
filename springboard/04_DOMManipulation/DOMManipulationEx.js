// 1 Select the section with an id of container without using querySelector.
const containerNoQ = document.getElementById('container');

// 2 Select the section with an id of container using querySelector.
const containerWithQ = document.querySelector('#container');

// 3 Select all of the list items with a class of “second”.
const liWithSecond = document.getElementsByClassName('second');

// 4 Select a list item with a class of third, but only the list item inside of the ol tag.
const liWithThirdInOl = document.querySelector('ol .third');

// 5 Give the section with an id of container the text “Hello!”.
// containerWithQ.textContent = "Hello!";
// commented out to continue with task 9

// 6 Add the class main to the div with a class of footer.
const footer = document.querySelector('.footer');
footer.classList.toggle('main');

// 7 Remove the class main on the div with a class of footer.
footer.classList.remove('main');

// 8 Create a new li element.
const newLi = document.createElement('li');

// 9 Give the li the text “four”.
newLi.textContent = "four";

// 10 Append the li to the ul element.
const ul = document.querySelector('ul');
ul.append(newLi);

// 11 Loop over all of the lis inside the ol tag and give them a background color of “green”.
const ol = document.querySelector('ol');
const olChildren = ol.children;

for(e of olChildren) {
    e.style.backgroundColor = "green";
}

// 12 Remove the div with a class of footer
const foot = document.querySelector('.footer');
foot.remove();