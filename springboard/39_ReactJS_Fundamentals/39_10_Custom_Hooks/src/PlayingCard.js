import React, { useState } from "react";
import backOfCard from "./back.png";
import "./PlayingCard.css";
import useToggleFlip from './hooks/useToggleFlip';

/* Renders a single playing card. */
function PlayingCard({ front, back = backOfCard }) {
  const [isFacingUp, toggleFlip] = useToggleFlip();
  
  return (
    <img
      src={isFacingUp ? front : back}
      alt="playing card"
      onClick={toggleFlip}
      className="PlayingCard Card"
    />
  );
}

export default PlayingCard;
