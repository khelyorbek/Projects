// react components
import React, { useContext } from "react";
import { Switch, Route, Redirect } from "react-router-dom";

// Custom components and methods
import Home from "./Home";
import UserLogin from "./UserLogin";
import UserProfile from "./UserProfile";
import UserRegister from "./UserRegister";
import CompanyList from "./CompanyList";
import CompanyDetail from "./CompanyDetail";
import JobList from "./JobList";
import GlobalContext from './GlobalContext';

// Bootstrap
import Container from 'react-bootstrap/Container';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';

// receiving both function that were passed to us from App
const Routes = ({ login, signup }) => {
    // curruser conttext
    const { currentUser } = useContext(GlobalContext);

    return (
        <>
            <Container>
                <Col>
                    <Row>
                        <Switch>
                            <Route exact path="/">
                                < Home />
                            </Route>

                            <Route exact path="/login">
                                {/* passing down the login function that was passed to this component from App */}
                                {/* this will be used by our UserLogin component to trigger the login */}
                                {currentUser ? <Redirect to="/companies" /> : ''}
                                < UserLogin login={login} />
                            </Route>

                            <Route exact path="/signup">
                                {/* passing down the signup function that was passed to this component from App */}
                                {/* this will be used by our UserRegister component to trigger the registration */}
                                < UserRegister signup={signup} />
                            </Route>

                            <Route exact path="/profile">
                                {/* passing down the login function that was passed to this component from App */}
                                {/* this will be used by our UserProfile component to check the password typed in */}
                                {/* if user tries to go to this route without logging in, gets redirected to /login */}
                                {currentUser
                                    ? < UserProfile login={login}/>
                                    : <Redirect to="/login" />
                                }
                                
                            </Route>

                            <Route exact path="/companies">
                                {/* rendering our CompanyList component */}
                                {/* if user tries to go to this route without logging in, gets redirected to /login */}
                                {currentUser
                                    ? < CompanyList />
                                    : <Redirect to="/login" />
                                }

                            </Route>

                            <Route exact path="/companies/:handle">
                                {/* rendering our CompanyDetail component */}
                                {/* if user tries to go to this route without logging in, gets redirected to /login */}
                                {currentUser
                                    ? < CompanyDetail />
                                    : <Redirect to="/login" />
                                }

                            </Route>

                            <Route exact path="/jobs">
                                {/* rendering our JobList component */}
                                {/* if user tries to go to this route without logging in, gets redirected to /login */}
                                {currentUser
                                    ? < JobList />
                                    : <Redirect to="/login" />
                                }

                            </Route>

                            <Redirect to="/" />

                        </Switch>
                    </Row>
                </Col>
            </Container>
        </>
    )
}

export default Routes;