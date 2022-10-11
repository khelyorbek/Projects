import React, { useEffect, useState } from 'react';

const Card = (props) => {
    const [deg, setDeg] = useState('0');

    useEffect(() => {
        setDeg(Math.floor(Math.random() * (30 - -30 + 1) + -30));
    }, []);

    return (
        <>
            <div className="Card">
            <img style={{position: 'absolute', top: '10%', left: '10%', transform: `rotate(${deg}deg)` }} src={props.cardImg} alt={props.cardImg}></img>            
            </div>
            
        </>
    )
}
export default Card;