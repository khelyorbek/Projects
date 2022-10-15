import React from 'react';
import './App.css';
import DogList from './DogList';
import DogDetails from './DogDetails';
import Nav from './Nav';
import { Switch, Route, Redirect, BrowserRouter } from 'react-router-dom'

function App(props) {
  const dogNames = props.dogs.map(dog => dog.name);
  // console.log(dogNames);

  return (
    <BrowserRouter>
    <Nav dogNames={dogNames}/>
    <Switch>
      <Route exact path="/dogs" >
        <DogList /> 
      </Route>
      <Route path="/dogs/:name" >
        <DogDetails dogs={props.dogs}/> 
      </Route>
      <Redirect to="/dogs" />
    </Switch>
    </BrowserRouter>
  );
}

App.defaultProps = {
  dogs: [
    {
      name: "Whiskey",
      age: 5,
      src: 'whiskey',
      facts: [
        "Whiskey loves eating popcorn.",
        "Whiskey is a terrible guard dog.",
        "Whiskey wants to cuddle with you!"
      ]
    },
    {
      name: "Duke",
      age: 3,
      src: 'duke',
      facts: [
        "Duke believes that ball is life.",
        "Duke likes snow.",
        "Duke enjoys pawing other dogs."
      ]
    },
    {
      name: "Perry",
      age: 4,
      src: 'perry',
      facts: [
        "Perry loves all humans.",
        "Perry demolishes all snacks.",
        "Perry hates the rain."
      ]
    },
    {
      name: "Tubby",
      age: 4,
      src: 'tubby',
      facts: [
        "Tubby is really stupid.",
        "Tubby does not like walks.",
        "Angelina used to hate Tubby, but claims not to anymore."
      ]
    }
  ]
}

export default App;
