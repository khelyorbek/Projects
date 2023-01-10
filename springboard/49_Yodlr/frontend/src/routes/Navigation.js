import Container from 'react-bootstrap/Container';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';
import { NavLink } from 'react-router-dom'
import './Navigation.css';

function Navigation() {
    return (
        <Navbar collapseOnSelect expand="lg" bg="light" variant="light">
            <Container>
                <Navbar.Brand as={NavLink} to="/" id="navlinkbrand">
                    <img
                        src="logoipsum-293.svg"
                        width="30"
                        height="30"
                        className="d-inline-block align-top"
                        alt="Yodlr Logo"
                    />
                </Navbar.Brand>
                <Navbar.Toggle aria-controls="responsive-navbar-nav" />
                <Navbar.Collapse id="responsive-navbar-nav">
                    <Nav className="me-auto" id="navlinks">
                        <Nav.Link as={NavLink} to="register">Register</Nav.Link>
                        <Nav.Link as={NavLink} to="admin">Administration</Nav.Link>
                    </Nav>
                </Navbar.Collapse>
            </Container>
        </Navbar>
    );
}

export default Navigation;
