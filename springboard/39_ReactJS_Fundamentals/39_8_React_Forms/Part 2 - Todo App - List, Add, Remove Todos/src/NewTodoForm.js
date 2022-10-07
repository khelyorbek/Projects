import React, { useState } from 'react';

const NewTodoForm = ({ addTodo }) => {
    const INITIAL_STATE = {
        todoTitle: ''
    }

    // using state to keep track of user's interaction with the forms
    const [formData, setFormData] = useState(INITIAL_STATE);

    // custom function to keep track of typed changed from the forms
    const handleChange = (e) => {
        const { name, value } = e.target

        setFormData(formData => ({
            ...formData,
            [name]: value
        }))
    }

    // custom function to add the data into parent component's state
    const handleSubmit = (e) => {
        e.preventDefault();
        addTodo({...formData});
        // console.log(formData)
        setFormData(INITIAL_STATE);
    }    

    return (
    <>
        <form onSubmit={handleSubmit}>
            <label htmlFor="todoTitle">New task name:</label>
            <input type="text" id="todoTitle" name="todoTitle" placeholder="Type in the task name here" onChange={handleChange} value={formData.todoTitle}></input>
            <br></br>
            <button>Create new todo</button>
        </form>
    </>
        )
}

export default NewTodoForm;