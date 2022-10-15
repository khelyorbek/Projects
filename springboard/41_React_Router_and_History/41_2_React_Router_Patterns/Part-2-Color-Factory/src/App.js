import React, { useState } from 'react';
import './App.css';
import { BrowserRouter, Route, Redirect  } from 'react-router-dom';
import NavColors from './NavColors';
import Color from './Color';
import NewColorForm from './NewColorForm';

function App() {
  const [colors, setColors] = useState(['red','blue','green'])

  const addColor = (color) => {
    setColors([...colors, color]);
  }

  return (
    <div className="App" style={{display:'flex', flexDirection:'column', alignItems: 'center'}}>
      <h1>App</h1>
      <BrowserRouter>
        < NavColors colors={colors}/>

        <Route exact path='/colors/new'> <NewColorForm addColor={addColor} /> </Route>
        <Route exact path='/colors/:colorName'> <Color colors={colors} /> </Route>
        
        <Redirect to="/colors"/>
      </BrowserRouter>
    </div>
  );
}

export default App;

