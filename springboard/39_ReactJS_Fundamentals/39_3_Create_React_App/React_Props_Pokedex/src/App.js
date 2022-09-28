import React from 'react';
import './App.css';
import Pokedex from './Pokedex';
import PokemonList from './PokemonList';

function App() {
  return (
    <div className="App">
      <Pokedex pokemonList={PokemonList}/>
    </div>
  );
}

export default App;
