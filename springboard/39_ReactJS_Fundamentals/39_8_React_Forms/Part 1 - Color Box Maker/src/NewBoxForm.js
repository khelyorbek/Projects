import React, { useState } from 'react';

const NewBoxForm = ({ addBox }) => {
    const INITIAL_STATE = {
        width: '', 
        height: '', 
        bgColor: '#000000'
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
        addBox({...formData});
        // console.log(formData)
        setFormData(INITIAL_STATE);
    }    

    return (
    <>
        <form onSubmit={handleSubmit}>
            <label htmlFor="width">Width:</label>
            <input type="number" id="width" name="width" placeholder="Type in the width here" onChange={handleChange} value={formData.width}></input>
            <br></br>
            <label htmlFor="height">Height:</label>
            <input type="number" id="height" name="height" placeholder="Type in the height here" onChange={handleChange} value={formData.height}></input>
            <br></br>
            <label htmlFor="bgColor">Background Color:</label>
            <input type="color" id="bgColor" name="bgColor" onChange={handleChange} value={formData.bgColor}></input>
            <br></br>
            <button>Create new box</button>
        </form>
    </>
        )
}

export default NewBoxForm;