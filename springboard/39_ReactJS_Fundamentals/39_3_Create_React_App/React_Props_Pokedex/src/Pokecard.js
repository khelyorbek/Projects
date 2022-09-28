import React from 'react';

const Pokecard = (props) => {
    return (<div>
        <h3>{props.name}</h3>
        <img src={"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/" + props.imgSrc + ".png"} alt={props.name}></img>
        <p>Type: {props.type}</p>
        <p>Exp: {props.exp}</p>
    </div>
    )
}

export default Pokecard;