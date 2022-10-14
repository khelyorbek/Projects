import React from 'react';
import './App.css';
import VendingMachine from './VendingMachine';
import KitKat from './KitKat';
import Oreos from './Oreos';
import Goldfish from './Goldfish';

import { BrowserRouter, Route, Routes } from "react-router-dom";

function App() {
  return (
    <div className="App">
      <BrowserRouter>
                <Routes>
                    <Route exact path="/" element={<VendingMachine/>} />
                    <Route exact path="/kitkat" element={<KitKat/>} />
                    <Route exact path="/oreos" element={<Oreos/>} />
                    <Route exact path="/goldfish" element={<Goldfish/>} />
                </Routes>
        </BrowserRouter>
    </div>
  );
}

export default App;
