import React from 'react';
import { Link } from "react-router-dom";

const KitKat = () => {
    return (
        <>
            
            <img style={{width: '30em', marginBottom: '2em'}} src="https://images.heb.com/is/image/HEBGrocery/001353618?fit=constrain,1&wid=800&hei=800&fmt=jpg&qlt=85,0&resMode=sharp2&op_usm=1.75,0.3,2,0"></img>

            <p>
                <Link to="/">Go back to Vending Machine</Link>
            </p>
        </>
    )
}

export default KitKat;