import React from 'react';

// this component should display a div with a background color, width and height based on the props passed to it.
const Todo = (props) => {
    const handleRemove = (e) => {
        props.removeTodo(props.todoTitle);
    }

    return (<li>{props.todoTitle} <button onClick={handleRemove}>X</button></li>)
}

export default Todo;