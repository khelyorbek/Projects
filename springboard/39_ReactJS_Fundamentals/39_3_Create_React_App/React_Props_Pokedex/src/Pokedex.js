import React from 'react';
import Pokecard from './Pokecard';
import './Pokedex.css';

const Pokedex = (props) => {
    return (
    props.pokemonList.map(p => (
        <div className="Pokedex">
            <Pokecard name={p.name} type={p.type} exp={p.base_experience} imgSrc={p.id}/>
        </div>)
    ))
    
}

export default Pokedex;