import React, { useState } from 'react';

const NewColorForm = (props) => {
    // creating an initial state so we can initialize the form and clean it afterwards if necessary
    const initialState = {
        color: ''
    }

    // creating state to store form data and also setter function
    const [formData, setFormData] = useState(initialState);

    // creating a universal changle handler function that stored values into state
    const handleChange = e => {
        // taking the target of the event and destructuing the name attribute and the value of the input
        const { name, value } = e.target;

        // setting the new value of the state
        setFormData(data => ({
            // to be the current value of the state
            ...data,
            // and whenever the new value is (Example: nameOfInput: valueOfInput)
            [name]: value
        }))
    }

    // creating a custom method to handle the submission of the form
    const handleSubmit = (e) => {
        // preventing default behavior
        e.preventDefault();
        props.addColor([formData.color])
    }

    return (
        <>
            <input onChange={handleChange} type="text" style={{marginTop: '1em', padding: '1em'}} placeholder='Enter new color here' name='color'></input>
            <button onClick={handleSubmit} style={{marginTop: '1em', padding: '1em', fontSize:'1em', fontWeight: 'bold'}}>Add Color</button>
        </>
    )
}

export default NewColorForm;