import React from 'react';
import KitKat from './KitKat';
import Oreos from './Oreos';
import Goldfish from './Goldfish';
import "./VendingMachine.css";

import { Link } from "react-router-dom";

const VendingMachine = () => {
    return (
        <>
            <h1>Vending Machine</h1>
            
                <h2>Please make a selection from the options below:</h2>

                <Link to="/kitkat">KitKat</Link>
                <Link to="/oreos">Oreos</Link>
                <Link to="/goldfish">Goldfish</Link>
  
        </>
    )
}

export default VendingMachine;