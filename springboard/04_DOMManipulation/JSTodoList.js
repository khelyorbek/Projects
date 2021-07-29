// Finding the elements first
const toDoOL = document.querySelector('#currentToDoList');
const newTodoForm = document.querySelector('#newToDoForm');
const newTodoText = document.querySelector('#newToDoText');

document.addEventListener("DOMContentLoaded", function() {
    
});

// Adding logic to mark current to do items as complete or remove it
toDoOL.addEventListener('click', function(event){
    // for debugging purposes
    console.log(event);
    

    if(event.target.tagName === 'BUTTON') {
        event.target.parentElement.remove();
    } else if (event.target.tagName === 'LI') {
        // if the li has empty text decoration on click, set it to strike through.
    // if the li doesn't have an empty decoration, set it to empty.
    if(event.target.style.textDecoration == '') {
        event.target.style.textDecoration = 'line-through';
    } else {
        event.target.style.textDecoration = '';
    }
    }
})

// Adding logic to add a new to do item into the list
newTodoForm.addEventListener('submit', function(event) {
    // preventing the form from refreshing and redirecting
    event.preventDefault();

    // creating a new li element that will house the new to do item
    const newTodo = document.createElement('li');
    // getting the value from the text box and assigning to the inner text of li
    newTodo.innerText = newTodoText.value + "   ";
    // appending the newly created li into the OL
    toDoOL.append(newTodo);

    // creating the button element that will house the remove button
    const newToDoRemoveButton = document.createElement('button');
    // adding the remove text into the button
    newToDoRemoveButton.innerText = "Remove";
    // appending the new button to the end of the li
    newTodo.append(newToDoRemoveButton);
    
    
    let allTodos = localStorage.getItem('allTodos'); // not an array
    
    if(allTodos === null) {
        allTodos = [];
    }

   allTodos.push('test 1');
   localStorage.setItem('allTodos', JSON.stringify(allTodos));

    // clearing out the value in the text box
    newTodoText.value = '';

    
    
    // for debugging purposes
    console.log("Form submitted");
});

function addToLocalStorage(text, completed){
    const toDoObject = {
        text, completed
    };
    // Local storage addition
    localStorage.setItem(JSON.stringify(toDoObject));
}