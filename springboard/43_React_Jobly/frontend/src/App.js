// Standard React Library
import React, { useState, useEffect } from 'react';

// React router
import { BrowserRouter } from 'react-router-dom';

// CSS and assets
import './App.css';

// Bootstrap React
import Button from 'react-bootstrap/Button';

// Custom components and functions
import JoblyApi from './api';
import Home from './Home';
import NavigationBar from './NavigationBar';
import Routes from './Routes';

function App() {
  // const [test, setTest] = useState();

  // async function getData() {
  //   let res = await JoblyApi.getCompany("bauer-gallagher");
  //   setTest(res);
  // }

  // useEffect(() => {
  //   getData();
  // },[])
  
  // console.log(test);

  return (
    <div className="App">

      <BrowserRouter>
        
        < NavigationBar />

        < Routes />
      
      </BrowserRouter>

    </div>
  );
}

export default App;
