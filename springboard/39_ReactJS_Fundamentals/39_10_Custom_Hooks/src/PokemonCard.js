import React, { useState } from "react";
import "./PokemonCard.css";
import useToggleFlip from './hooks/useToggleFlip';

/* Renders a single pokemon card. */
function PokemonCard({ front, back, name, stats }) {
  const [isFacingUp, toggleFlip] = useToggleFlip();

  return (
    <div onClick={toggleFlip} className="PokemonCard Card">
      {isFacingUp ? (
        <div className="PokemonCard-front">
          <img src={front} alt={`{name} front`} />
          <div>
            <p className="PokemonCard-name">{name}</p>
            <ul className="PokemonCard-stats">
              {stats.map(stat => (
                <li key={stat.name}>
                  <em>{stat.name}</em>: {stat.value}
                </li>
              ))}
            </ul>
          </div>
        </div>
      ) : (
        <div className="PokemonCard-back">
          <img src={back} alt={`{name} back`} />
        </div>
      )}
    </div>
  );
}

export default PokemonCard;
