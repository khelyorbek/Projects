import React from 'react';
import { NavLink } from 'react-router-dom';

const Nav = (props) => {
    return (
        <>
        <div className='Nav' style={{margin: '2em', backgroundColor: 'lightblue', fontSize: '1.3em'}}>
            {props.dogNames.map(dogName => <NavLink exact to={`/dogs/${dogName}`} key={dogName}><p>{dogName}</p></NavLink>)}
        </div>
        </>
    )
}

export default Nav;