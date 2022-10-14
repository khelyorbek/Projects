import React from 'react';
import { Link } from "react-router-dom";

const Oreos = () => {
    return (
        <>
            <img style={{width: '30em', marginBottom: '2em'}} src="https://images.heb.com/is/image/HEBGrocery/001617462"></img>

            <p>
                <Link to="/">Go back to Vending Machine</Link>
            </p>
        </>
    )
    
}

export default Oreos;