import React from 'react';
import { Link } from "react-router-dom";

const Goldfish = () => {
    return (
        <>
            <img style={{width: '25em', marginBottom: '2em'}} src="https://m.media-amazon.com/images/I/81vtvEBZRmS.jpg"></img>

            <p>
                <Link to="/">Go back to Vending Machine</Link>
            </p>
        </>
    )
}

export default Goldfish;