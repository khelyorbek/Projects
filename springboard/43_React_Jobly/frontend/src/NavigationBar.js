import React from 'react';
import logo from './logo.svg';
import Container from 'react-bootstrap/Container';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';
import { Link, NavLink } from "react-router-dom";

const NavigationBar = () => {
    return (<>
      <Navbar bg="dark" variant="dark" expand="lg">
        <Container>
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

            <Navbar.Collapse id="basic-navbar-nav">
              <Nav className="me-auto">
                <NavLink to="/companies" className="nav-link">Companies</NavLink>
                <NavLink to="/jobs" className="nav-link">Jobs</NavLink>
                <NavLink to="/login" className="nav-link">Login</NavLink>
                <NavLink to="/signup" className="nav-link">Sign Up</NavLink>
                <NavLink to="/profile" className="nav-link">Profile</NavLink>
              </Nav>
            </Navbar.Collapse>

        </Container>
    </Navbar>
        
    </>)
    
}

export default NavigationBar;

