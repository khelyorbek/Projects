import React from 'react';
import { NavLink } from 'react-router-dom';

const NavColors = (props) => {
    console.log(props.colors)
    return (
        <>
            Please select a color:
            {props.colors.map(color => <p>
                <NavLink exact to={`/colors/${color}`} key={color}> {color} </NavLink>
            </p>)}

            <p>
                <NavLink exact to='/colors/new'> ADD NEW COLOR </NavLink>
            </p>
        </>
    )
}

export default NavColors;