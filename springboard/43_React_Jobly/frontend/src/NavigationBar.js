// react components
import React, { useContext } from 'react';
import { NavLink } from "react-router-dom";

// importing logl
import logo from './logo.svg';

// Bootstrap
import Container from 'react-bootstrap/Container';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';

// Context
import GlobalContext from './GlobalContext';

// receiving the logout function that was passed to us from the App
const NavigationBar = ({ logout }) => {
  // context for currentUser
  const { currentUser } = useContext(GlobalContext);

  return (<>
    {/* bootstrap navbar component with some styling */}
    <Navbar bg="dark" variant="dark" expand="lg" >
      <Container>
        {/* logo and the home page link */}
        <NavLink to="/" className="navbar-brand">
          <img
            alt=""
            src={logo}
            width="30"
            height="30"
            className="d-inline-block align-top"
          />{' '}
          Jobly
        </NavLink>

        <Navbar.Toggle aria-controls="basic-navbar-nav" />

        {/* first part of the navbar, only shows if the user is logged in */}
        <Navbar.Collapse id="basic-navbar-nav" >
          {currentUser
            ? <>
              <Nav className="me-auto">
                <NavLink to="/companies" className="nav-link">Companies</NavLink>
                <NavLink to="/jobs" className="nav-link">Jobs</NavLink>
              </Nav>
            </>
            : ''
          }
        </Navbar.Collapse>

        {/* second part of the Navbar */}
        {/* if the user is logged in, shows profile link and link to signout */}
        {/* if the user is not logged in, shows links to login / signup */}
        <Nav>
          {currentUser
            ? <>
              <NavLink to="/profile" className="nav-link">Profile</NavLink>\
              {/* When the log out button is clicked, calling the function that was passed to us as a prop */}
              <NavLink to="/" className="nav-link" onClick={logout}>Log out ({currentUser.username})</NavLink>
            </>

            : <>
              <NavLink to="/login" className="nav-link">Login</NavLink>
              <NavLink to="/signup" className="nav-link">Sign Up</NavLink>
            </>}
        </Nav>
      </Container>
    </Navbar>

  </>)

}

export default NavigationBar;

